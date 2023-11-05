from pathlib import Path

# import ase
import numpy as np

# import pandas as pd
from ase.io import read

import kmcos
from kmcos.io import *
from kmcos.types import *

# from kmcos.utils import get_ase_constructor

filename = Path.cwd().name
model_name = filename.replace(".py", "")
model_name = model_name[: model_name.find("_build")]
kmc_model = kmcos.create_kmc_model(model_name)
# Meta information
kmc_model.set_meta(
    author="Tomoyuki TSUYAMA",
    email="tomoyuki.tsuyaman@gmail.com",
    model_name=model_name,
    model_dimension=3,
    debug=0,
)

ru = read("./Ru.cif").repeat([1, 1, 1])
# Move the sacaled positions to set for the first atom to origin.
# sc -- > [[0,0,0], [0.33333, 0.6666, 0.5]]
pos = ru.get_scaled_positions()
ru.set_scaled_positions(pos - pos[0])
normed_cell = ru.cell / ru.cell[0, 0]
# Just for in case, order of the name should be determined carefully.
# Later the species might be called by registered number.
kmc_model.add_species(name="ru", representation="Atoms('Ru')")
kmc_model.add_species(name="rn", representation="Atoms('Rn')")
kmc_model.add_species(name="at", representation="Atoms('At')")
kmc_model.add_species(name="empty")
kmc_model.species_list.default_species = "empty"

layer = kmc_model.add_layer(name="ru_slab")

###########
# Register Parameters
###########
kmc_model.add_parameter(
    name="ips_per_n", value=-0.02, adjustable=True, min=-1.0, max=-0.0001
)  # energy per bond
kmc_model.add_parameter(
    name="de_act", value=0.1, adjustable=True, min=0.0001, max=10.0
)  # activation energy
kmc_model.add_parameter(
    name="T", value=1500, adjustable=True, min=0, max=2000
)  # temperature

# Option1 for making cells
# kmc_model.lattice.representation = f"""[Atoms(symbols='Fe',
#          pbc=np.array([ True,  True, True], dtype=bool),
#          cell=np.array({str((fept.cell / 2).tolist())}),
#          scaled_positions=np.array([[0,0,0]]),
# )]"""

# Option2 for making cells
layer.sites.append(Site(name="p1", pos="0.0 0.0 0.0", default_species="ru"))
layer.sites.append(Site(name="p2", pos="0.33333 0.66666 0.5", default_species="ru"))
kmc_model.lattice.cell = ru.cell

# Option3 for making cell, but this time this will not work
# because cell will be reduced to half to reduce the number of sites to consider
# kmc_model.lattice.representation = '[%s]' % get_ase_constructor(ru)

###########
# register coordination
###########
def register_coords(base_site, offset, layer):
    """Get the coordinate on the layer

    Args:
        base_site (str): Str to designate the internal coordinateion
        offset (list like): offset
        layer (str): layername

    Returns:
        kmc_model.lattice.coord: coord obj
    """
    return kmc_model.lattice.generate_coord(f"{base_site}.{tuple(offset)}.{layer}")


uc_pos = {"p1": ru.get_positions()[0], "p2": ru.get_positions()[1]}


def get_1n(
    base_coord, atom=ru, all_site_names=["p1", "p2"], eps=0.1, n_expected_neighbors=12
):
    """
    Function to retrieve neighboring coordinates around a given base coordinate.

    Parameters:
    base_coord (Coord): The reference coordinate object.
    atom (Atom): The atomic structure object from which coordinates are obtained (default is variable `ru`).
    all_site_names (list): List of all site names (default is ["p1", "p2"]).
    eps (float): Tolerance for distance (default is 0.1).
    n_expected_neighbors (int): The expected number of neighboring coordinates (default is 12).

    Returns:
    np.array: Array of neighboring coordinates selected based on specified criteria.

    Raises:
    Exception: Raised if the number of selected coordinates doesn't match the expected count.
    """
    _internal_pos_name = all_site_names.copy()
    _internal_pos_name.remove(base_coord.name)
    the_other_internal_pos_name = _internal_pos_name[0]
    coord_cand = kmc_model.lattice.generate_coordset_offsets(
        size=[2, 2, 2],
        layer_name="ru_slab",
        site_name=base_coord.name,
        offset=base_coord.offset,
    )
    coord_cand += kmc_model.lattice.generate_coordset_offsets(
        size=[2, 2, 2],
        layer_name="ru_slab",
        site_name=the_other_internal_pos_name,
        offset=base_coord.offset,
    )
    coord_cand = np.array(coord_cand)
    abs_vec_from_pos = np.array([coo.pos - base_coord.pos for coo in coord_cand])
    dist = np.linalg.norm(abs_vec_from_pos, axis=1)
    mask = np.abs((dist - atom.cell[0, 0]) / atom.cell[0, 0]) < eps
    if len(coord_cand[mask]) != n_expected_neighbors:
        print(coord_cand[mask])
        raise Exception(
            f"The number of the selected coord is {len(coord_cand[mask])}, while expected {n_expected_neighbors}."
        )
    return coord_cand[mask]


###########
# bystander
###########
def get_byst_list(
    base_coord,
    possible_species,
    flag,
    atom=ru,
    all_site_names=["p1", "p2"],
    eps=0.1,
    n_expected_neighbors=12,
):
    """
    Generates a list of bystander coordinates based on the specified base coordinate and parameters.

    Parameters:
    base_coord (Coord): The base coordinate around which bystander coordinates are identified.
    possible_species (list): List of allowed species for bystander coordinates.
    flag (str): A designation flag for the bystander coordinates.
    atom (Atom): The atomic structure object (default is variable `ru`).
    all_site_names (list): List of all site names (default is ["p1", "p2"]).
    eps (float): Tolerance for distance in coordinate selection (default is 0.1).
    n_expected_neighbors (int): The expected number of bystander coordinates (default is 12).

    Returns:
    list: List of bystander coordinates selected based on the given criteria.

    Raises:
    Exception: Raised if the number of selected bystander coordinates doesn't match the expected count.
    """
    neighbors = get_1n(
        base_coord=base_coord,
        atom=atom,
        all_site_names=all_site_names,
        eps=0.1,
        n_expected_neighbors=12,
    )
    bystander_list = []
    # Register the NN
    for neighbor in neighbors:
        bystander_list.append(
            Bystander(coord=neighbor, allowed_species=possible_species, flag=flag)
        )

    if len(bystander_list) != 12:
        raise Exception(
            f"The number of the selected byst_st is {len(bystander_list)}, while expected {n_expected_neighbors}."
        )
    return bystander_list


def rm_byst_component(byst_list, rm_coords=None):
    """
    Removes specific compo
    
    Parameters:
    byst_list (list): List of bystander coordinates.
    rm_coords (list): List of coordinates to be removed (default is None).

    Yields:
    Bystander: Yields each bystander coordinate that doesn't match the removal coordinates.

    Note:
    This function iterates through the provided list of bystander coordinates. If removal coordinates are specified,
    it yields each bystander coordinate that does not match the coordinates marked for removal.
    """
    if rm_coords is not None:
        for byst in byst_list:
            if not byst.coord in rm_coords:
                yield byst


n_expected_neighbors = 12
k = 0
for base_pos_name in ["p1", "p2"]:
    # tss is transferred sites, array composed of kmcos coords objects
    origin = register_coords(base_pos_name, [0, 0, 0], "ru_slab")
    tss = get_1n(base_coord=origin)
    for ts in tss:
        bystander_list = []
        nn_origins = get_byst_list(
            base_coord=origin, possible_species=["ru", "rn"], flag="n1org"
        )
        # Remove ts from nn_origins, due to error in kmcos
        for byst in rm_byst_component(nn_origins, rm_coords=[ts]):
            bystander_list.append(byst)
        # add neighbors specific TS
        nn_ts = get_byst_list(base_coord=ts, possible_species=["ru", "rn"], flag="n1ts")
        # Remove origin from nn_ts, due to error in kmcos
        for byst in rm_byst_component(nn_ts, rm_coords=[origin]):
            bystander_list.append(byst)

        conditions = [Condition(species="ru", coord=origin)]
        conditions += [Condition(species="empty", coord=ts)]
        actions = [Action(species="ru", coord=ts)]
        actions += [Action(species="empty", coord=origin)]

        rate_constant = "1.00"
        # 1st row : Exp(dE/kBT) x Exp((n_aft - n_bef)*eps / kBT)
        # 2nd row : Correction to prevent atom goes out to space from slab (sigmoid)
        # 3rd row : Set Rn instead of PBC. By increaing the interactions between Au & Ru, Ru does not move from bottom layer
        otf_rate = f"""base_rate * \
            exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) * \
            (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) * \
            exp(beta * (nr_rn_n1ts - nr_rn_n1org)* ips_per_n * 1e10000 *eV)
            """
        kmc_model.add_process(
            name=f"ru_interaction_{k}",
            conditions=conditions,
            actions=actions,
            bystander_list=bystander_list,
            rate_constant=rate_constant,
            otf_rate=otf_rate,
        )
        k += 1

kmc_model.print_statistics()
# Option 'local_smart','lat_int' and 'otf'
kmc_model.backend = "otf"  
kmc_model.clear_model()
kmc_model.save_model()
kmcos.compile(kmc_model)
