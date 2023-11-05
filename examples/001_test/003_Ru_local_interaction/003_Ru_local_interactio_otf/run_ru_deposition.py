from ase.io import write

# from pathlib import Path
from kmcos.run import KMC_Model

# from kmcos.view import main
from ase import geometry
from ase.build.tools import sort
from tqdm import tqdm
from kmcos.utils.make_superlattice_df import SuperlatticeDF
from kmcos.utils.surface_injection import InjectAtom
from pathlib import Path


def get_kmc_original_atoms(repeat):
    with KMC_Model(print_rates=False, banner=False, size=repeat) as model:
        atoms = model.get_atoms()
        return atoms


def make_slab(num_slab_layers, atoms):
    # Slab Part
    z_height = geometry.get_layers(atoms=atoms, miller=(0, 0, 1))[1][num_slab_layers]
    slab = atoms[atoms.get_positions()[:, 2] <= z_height]
    # Blocking Layer for 2 layers(to kill pbc)
    z_height = geometry.get_layers(atoms=slab, miller=(0, 0, 1))[1][2]
    slab.symbols[slab.get_positions()[:, 2] <= z_height] = "Rn"
    z_height = geometry.get_layers(atoms=slab, miller=(0, 0, 1))[1][1]
    slab.symbols[slab.get_positions()[:, 2] <= z_height] = "At"
    return slab


def main():
    repeat = [20, 20, 15]
    kmc_original_atoms = get_kmc_original_atoms(repeat)
    slab = make_slab(num_slab_layers=6, atoms=kmc_original_atoms)
    make_df = SuperlatticeDF(kmc_original_atoms, target_atoms=slab, repeat=repeat)
    merged = make_df.df_merge(fill_empty_with="empty")
    inner_coord_table = merged[
        ["x_inner", "y_inner", "z_inner", "inner_coord_number"]
    ].drop_duplicates()

    avalable_cells = len(kmc_original_atoms) - len(slab)
    num_atoms_per_inject = 10
    num_iter = int(avalable_cells / num_atoms_per_inject * 0.5)
    kmc_lattice = kmc_original_atoms.get_positions()
    kmc_lattice_z = geometry.get_layers(kmc_original_atoms, [0,0,1])[1]
    critical_angle = 89

    atoms_list = []
    with KMC_Model(print_rates=False, banner=False, size=repeat) as model2:
        converter = {
            "ru": model2.proclist.ru,
            "empty": model2.proclist.empty,
            "rn": model2.proclist.rn,
            "at": model2.proclist.at,
        }
        for coord, type in zip(
            merged[["x_cell", "y_cell", "z_cell", "inner_coord_number"]].values,
            merged["types_y"],
        ):
            model2._put(coord.tolist(), converter[type])
        model2._adjust_database()
        atoms = model2.get_atoms()
        atoms_list.append(atoms)
        model2.parameters.T = 10
        inject_atom = InjectAtom(atoms, critical_angle, kmc_lattice, kmc_lattice_z)
        for _ in tqdm(range(num_iter)):
            for __ in range(num_atoms_per_inject):
                inject_atom.slab = atoms
                retry = 0
                while True:
                    try :
                        attached = inject_atom.get_adatom_positions()
                        break
                    except:
                        retry += 1
                        if retry == 10:
                            raise Exception("Failed to retrieve adatom positions after multiple attempts.")
                coord = inject_atom.convert_coord(attached, repeat, inner_coord_table)
                model2._put(coord, converter["ru"])
            model2._adjust_database()
            atoms = model2.get_atoms()
            atoms_list.append(atoms)
            print(len(atoms))
            model2.do_steps(10_000)

    for i, atoms in enumerate(atoms_list):
        if i == 0:
            write("atoms_trajectory.xyz", atoms, append=False)
        else:
            write("atoms_trajectory.xyz", atoms, append=True)


if __name__ == "__main__":
    main()
