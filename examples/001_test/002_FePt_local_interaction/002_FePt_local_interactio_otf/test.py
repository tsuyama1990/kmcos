import ase
from ase.io import read, write
import numpy as np
import pandas as pd
from pathlib import Path
from ase.io.trajectory import Trajectory

repeat = 20
cell_ratio = 1/2

from kmcos.run import KMC_Model
from kmcos.view import main


with KMC_Model(print_rates=False, banner=False) as model:
    model.settings.simulation_size = repeat
    atoms = model.get_atoms()

current = Path(__file__).resolve().parent
cif_path = current.parent / "FePt.cif"
fept = read(cif_path)

target_repeat = np.array([repeat] * 3) * cell_ratio
target_atoms = fept.repeat(target_repeat.astype(int))

def inner_coord_number(df, i):
    # TODO Tomo need to change to lattice site name
    df["inner_coord_number"] = i
    return df

def make_dataframe(atoms, repeat):
    tmp = atoms.get_scaled_positions() * repeat
    tmp_cell = np.round(tmp - 0.4, 0) #round 0.9 - 1.9 to 1
    tmp_internal = np.round(tmp - tmp_cell,3) # getinternal displacement
    df = pd.DataFrame(np.concatenate([tmp_cell,
                                      tmp_internal],
                                      axis=1),
                        columns=[f"{i}_{j}" for j in ["cell", "inner"] for i in list("xyz")])
    
    df[["x_cell", "y_cell", "z_cell"]] = df[["x_cell", "y_cell", "z_cell"]].applymap(lambda x : int(x))
    #df[["x_inner", "y_inner", "z_inner"]] = df[["x_inner", "y_inner", "z_inner"]].applymap(lambda x : round(x, 4))
    df["types"] = atoms.symbols
    df["types"] = df["types"].map(lambda x : x.lower())

    box = []
    k = 1
    for i, j in df.groupby(by = ["x_inner", "y_inner", "z_inner"
                                 ]):
        tmp_df = inner_coord_number(j, k)
        box.append(tmp_df)
        k += 1
    df = pd.concat(box)

    return df

df_model = make_dataframe(atoms, repeat)
df_target = make_dataframe(target_atoms, repeat)
merged = pd.merge(df_model, df_target, on=["x_cell", "y_cell", "z_cell", "x_inner", "y_inner", "z_inner", "inner_coord_number"], how="left")
#merged = pd.merge(df_model, df_target, on=["x_cell", "y_cell", "z_cell"], how="left")
merged["types_y"].fillna("empty", inplace=True)

temp_list = np.arange(1600, 1500, -1)
atoms_list = []
with KMC_Model(print_rates=False, banner=False) as model:
    model.settings.simulation_size = repeat
    converter = {"fe": model.proclist.fe, "empty": model.proclist.empty, "pt": model.proclist.pt}
    for coord, type in zip(merged[["x_cell", "y_cell", "z_cell", "inner_coord_number"]].values, merged["types_y"]):
        model._put(coord.tolist(), converter[type])
    model._adjust_database()
    model.parameters.T = 1600
    model.do_steps(100_000)
    for temp in temp_list:
        model.parameters.T = temp
        model.do_steps(1_000)
        atoms = model.get_atoms()
        atoms_list.append(atoms)

for atoms in atoms_list:
    write('atoms_trajectory.xyz', atoms, append = True)