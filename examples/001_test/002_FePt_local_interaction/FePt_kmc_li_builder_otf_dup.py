import kmcos
from kmcos.types import *
from kmcos.io import *
import numpy as np
import ase
from ase.io import read, write
from pathlib import Path
from kmcos.utils import get_ase_constructor
from pathlib import Path
import os
from itertools import product
import pandas as pd

filename = Path.cwd().name
model_name = filename.replace(".py", "")
model_name = model_name[: model_name.find("_build")]
kmc_model = kmcos.create_kmc_model(model_name)
# Meta information
kmc_model.set_meta(author='Tomoyuki TSUYAMA',
            email='tomoyuki.tsuyaman@gmail.com',
            model_name=model_name,
            model_dimension=3,
            debug=0)

fept = read("./FePt.cif").repeat([1,1,1])

# Just for in case, order of the name should be determined carefully.
# Later the species might be called by registered number
kmc_model.add_species(name='fe',
               representation="Atoms('Fe')")
kmc_model.add_species(name='pt',
               representation="Atoms('Pt')")
kmc_model.add_species(name='empty',)
kmc_model.species_list.default_species = 'empty'

layer = kmc_model.add_layer(name='fept',)

###########
# Register Parameters
###########
kmc_model.add_parameter(name='J_NN', value=0.0465, adjustable=True, min=0.10, max=0.01)
kmc_model.add_parameter(name='J_NNN', value=-0.0093, adjustable=True, min=-0.02, max=-0.002)
kmc_model.add_parameter(name='T', value=1500, adjustable=True, min=0, max=2000)

# Option1 for making cells
#kmc_model.lattice.representation = f"""[Atoms(symbols='Fe',
#          pbc=np.array([ True,  True, True], dtype=bool),
#          cell=np.array({str((fept.cell / 2).tolist())}),
#          scaled_positions=np.array([[0,0,0]]),
#)]"""

# Option2 for making cells
layer.sites.append(Site(name='origin', pos='0 0 0', default_species='Fe'))
kmc_model.lattice.cell = fept.cell / 2

# Option3 for making cell, but this time this will not work 
# because cell will be reduced to half to reduce the number of sites to consider
#kmc_model.lattice.representation = '[%s]' % get_ase_constructor(fept)

###########
# register coordination
###########
nn = {}
k = 0
nn[f"base_coord_{k}"] = kmc_model.lattice.generate_coord(f'origin.(0,0,0).fept')
k += 1
for i in [-1, 1]:
    for j in [-1, 1]:
        nn[f"base_coord_{k}"] = kmc_model.lattice.generate_coord(f'origin.(0,{i},{j}).fept')
        k += 1
        nn[f"base_coord_{k}"] = kmc_model.lattice.generate_coord(f'origin.({j},0,{i}).fept')
        k += 1
        nn[f"base_coord_{k}"] = kmc_model.lattice.generate_coord(f'origin.({i},{j},0).fept')
        k += 1

###########
# generate_coords for process
###########
def get_NN_and_NNN(base_coord, inv_cell, eps=0.05):
    """
    Provide NN, and NNN coordinates

    """
    # fetch a lot of coordinates, around "base_coord_{k}"
    coords = kmc_model.lattice.generate_coordset_offsets(size=[2, 2, 2],
                                                         layer_name='fept',
                                                         site_name=base_coord.name,
                                                         offset=base_coord.offset)
    # The distance of NN ~ sqrt(2)
    nn_coords = [nn_coord for nn_coord in coords
                if np.abs((np.linalg.norm((nn_coord.pos - base_coord.pos)@ inv_cell)) - np.sqrt(2)) < eps]

    # The distance of NNN ~ 2
    nnn_coords = [nnn_coord for nnn_coord in coords
                if np.abs((np.linalg.norm((nnn_coord.pos  - base_coord.pos)@ inv_cell)) - 2) <= eps]
    
    if len(nn_coords) != 12:
        raise UserWarning(f"the number of the NN_coord is {len(nn_coords)}, and not 12. check the criteria")
    if len(nnn_coords) != 6:
        raise UserWarning(f"the number of the NNN_coord is {len(nnn_coords)}, and not 6. check the criteria")
    
    return nn_coords, nnn_coords

inv_cell = np.linalg.inv(fept.cell / 2)
nn_coords_origin, nnn_coords_origin = get_NN_and_NNN(nn[f"base_coord_0"], inv_cell, eps=0.05)
k = 0
for coord_name, base_coord in nn.items():
    if coord_name == f"base_coord_0":
        # No registration at centre
        print(f"passes for {coord_name}")
        pass
    else :
        print(f"Making process for {coord_name}")
        nn_coords_base, nnn_coords_base = get_NN_and_NNN(base_coord, inv_cell, eps=0.05)
        # Add neighborhoods of origin
        neighbor_dict = {"nn": 
                        {"ori" : nn_coords_origin, "base" : nn_coords_base},
                        "nnn":
                        {"ori" : nnn_coords_origin, "base" : nnn_coords_base},
                        }
        
        bystander_list = []
        for neighbor_type, coord_site_dict in neighbor_dict.items():
            for site_type, coords in coord_site_dict.items():
                for coord in coords:
                    if not (coord == base_coord)|(coord == nn[f"base_coord_0"]) :

                        bystander_list.append(Bystander(coord=coord,
                                                        allowed_species=["fe", "pt", ],
                                                        flag=f'{neighbor_type}{site_type}'))
                
                    else:
                        pass
                        print("noooo!")
        # And the 
        # central site

        conditions = [Condition(species='fe', coord=nn[f"base_coord_0"])]
        conditions += [Condition(species='pt', coord=base_coord)]
        

        # The action: central site is empty
        actions = [Action(species='pt', coord=nn[f"base_coord_0"])]
        actions += [Action(species='fe', coord=base_coord)]


        rate_constant = "1.00"
        #otf_rate = "base_rate * 1.00"
        otf_rate = f"""base_rate * min(1.00, \
                exp(beta *
                    (
                        J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))
                        +
                        J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))
                    ) *eV
                )
            )\
            """
        kmc_model.add_process(name=f"FePt_interaction_{k}",
                    conditions=conditions,
                    actions=actions,
                    bystander_list = bystander_list,
                    rate_constant=rate_constant,
                    otf_rate=otf_rate,
                    )
        
        k += 1
   
kmc_model.print_statistics()
kmc_model.backend = 'otf' #specifying is optional. 'local_smart' is the default. Currently, the other options are 'lat_int' and 'otf'
kmc_model.clear_model() #This line is optional: if you are updating a model, this line will remove the old model files (including compiled files) before exporting the new one. It is convenient to always include this line because then you don't need to 'confirm' removing/overwriting the old model during the compile step.
kmc_model.save_model()
kmcos.compile(kmc_model)
