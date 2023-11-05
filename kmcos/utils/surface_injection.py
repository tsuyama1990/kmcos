import numpy as np
from scipy.spatial import distance
from ase import geometry 
import pandas as pd

class InjectAtom():
    def __init__(self, slab_atoms, critical_angle, kmc_lattice, kmc_lattice_z):
        self.slab = slab_atoms
        self.kmc_lattice = kmc_lattice
        self.critical_angle = np.deg2rad(critical_angle)
        self.kmc_lattice_z = kmc_lattice_z

    def generate_vector(self, critical_angle):
        a, b = np.random.rand() - 0.5, np.random.rand() - 0.5 #Uniform distribution
        c_min_neg = - np.abs(1 / np.tan(critical_angle)) * (a **2 + b **2) **(1/2)
        c = c_min_neg - np.random.rand() * (1 - c_min_neg)
        _x0 = self.slab.get_positions().max(axis=0)[0] * np.random.rand()
        _y0 = self.slab.get_positions().max(axis=0)[1] * np.random.rand()
        _z0 = self.slab.cell[2, 2]
        direct = np.array([-a/c, -b/c, -1])
        offset = np.array([_x0, _y0, _z0])
        self.inject_angle = np.rad2deg(np.arccos(np.dot(direct, np.array([0,0,-1])) / np.linalg.norm(direct)))
        return direct, offset
    
    def map_lines(self, lp):
        dt = 0.05
        z_max = self.slab.cell[2,2]
        z_min = 0
        z = np.arange(z_min, z_max, dt)
        # Map vector to line
        line = np.tile(z, (3, 1)).T * lp[0] + lp[1]
        # Convert to scaled_vector
        line_scaled = np.dot(line, np.linalg.inv(self.slab.cell))
        ## TODO how to get the max scaled_positions
        wrap_max = np.array([1,1,1]) ##### Temporary
        ## atoms.get_scaled_positions().max(axis=0) might be one of the candidate.
        line_scaled_wrap = line_scaled % wrap_max
        line_wrapped = np.dot(line_scaled_wrap, self.slab.cell)
        return line_wrapped
    
    def get_surace_top_z(self, slab, z_array):
        for i, z in enumerate(z_array):
            length = np.sum(np.abs(slab.get_positions()[:, 2] - z) < 0.1)
            if length == 0:
                slab_surface = z
                break
        slab_surface = z_array[i-1]
        return slab_surface
    
    def get_surace_bot_z(self, slab):
        layers = pd.Series(geometry.get_layers(slab, miller=[0,0,1])[0])
        atom_num_at_layer = layers.value_counts()
        max_num = atom_num_at_layer.max()
        atom_num_at_layer.values < max_num
        first_vacancy = np.argmax(atom_num_at_layer.values < max_num)
        if first_vacancy == 0:
            # when no vacancies, e.g. very first shot of the kmc
            first_vacancy = atom_num_at_layer.index[-1]
        return geometry.get_layers(slab, miller=[0,0,1])[0][first_vacancy]

    
    def get_minimum_distance(self, atom_positions, lp_w, thresh, Ru_z_min, Ru_z_max):
        atom_positions = atom_positions[
            (atom_positions[:, 2] >= Ru_z_min - thresh)
            &
            (atom_positions[:, 2] <= Ru_z_max + thresh)
        ]
        lp_w = lp_w[(lp_w[:, 2] >=  Ru_z_min - thresh)&(lp_w[:, 2] <=  Ru_z_max + thresh)]
        dist = distance.cdist(atom_positions, lp_w, "euclidean")
        min_dis_mask = dist.min(axis=1) < thresh
        hit_atoms = atom_positions[min_dis_mask]
        return hit_atoms
    
    def get_adatom_positions(self):
        lp = lp = self.generate_vector(self.critical_angle)
        lp_w = self.map_lines(lp)
        hit_atom = self.get_minimum_distance(self.slab.get_positions(), 
                                             lp_w, 
                                             thresh=3, 
                                             Ru_z_min=self.get_surace_bot_z(self.slab), 
                                             Ru_z_max=self.get_surace_top_z(self.slab, self.kmc_lattice_z))
        max_id = [i for i, x in enumerate(hit_atom) if x[2] == np.max(hit_atom[:, 2])]
        surface_hit_atom = hit_atom[max_id]
        atm_id = np.random.choice(range(len(surface_hit_atom)))
        dist = np.linalg.norm(self.kmc_lattice - surface_hit_atom[atm_id], axis=1)
        possible_positions = []
        for i in self.kmc_lattice[np.all([dist>2.5, dist<2.9], axis=0)]:
            if not np.any(np.linalg.norm(self.slab.get_positions() - i, axis=1) < 0.3):
                possible_positions.append(i)
        attached_id = np.random.choice(range(len(possible_positions)))
        atttached_position = possible_positions[attached_id]
        return atttached_position
    
    def convert_coord(self, adatom_position, repeat, inner_coord_table):
        _adatom_position = adatom_position @ np.linalg.inv(self.slab.cell)
        tmp = _adatom_position * repeat
        tmp_cell = np.round(tmp - 0.4, 0) #round 0.9 - 1.9 to 1. 
        tmp_internal = np.round(tmp - tmp_cell, 3)
        _coord = {"cell" : tmp_cell.astype(int), "internal": tmp_internal}
        inner_coord_num = self.get_inner_coord_num(inner_coord_table, _coord["internal"])
        coord = _coord["cell"].tolist() + [inner_coord_num]
        return coord

    def get_inner_coord_num(self, inner_coord_table, coord_fractional):
        #inner_coord_table = merged[["x_inner","y_inner", "z_inner", "inner_coord_number"]].drop_duplicates()
        #vec = inner_coord_table[["x_inner","y_inner", "z_inner"]] - convert_coord(slab, attached, repeat)["internal"]
        vec = inner_coord_table[["x_inner","y_inner", "z_inner"]] - coord_fractional
        coord_mask = (vec**2).sum(axis=1)**(1/2) < 0.5/3 # eps corresponding to ~0.5 angstrom. 3 corresponds to atomic distance roughly.
        inner_coord_num = inner_coord_table[coord_mask]["inner_coord_number"].values
        if len(inner_coord_num) >= 2:
            raise Exception("The matched inner coordinations are found more than one")
        elif len(inner_coord_num) == 0:
            raise Exception("Not matched any of the internal coords")
        else :
            return inner_coord_num[0]