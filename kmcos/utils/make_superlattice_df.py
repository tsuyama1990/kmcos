import pandas as pd
import numpy as np

class SuperlatticeDF():
    def __init__(self, original_atoms, target_atoms, repeat):
        self.original_atoms = original_atoms
        self.target_atoms = target_atoms
        self.repeat = np.array(repeat)
    
    def make_dataframe(self, atoms, repeat):
        tmp = atoms.get_scaled_positions() * repeat
        tmp_cell = np.round(tmp - 0.4, 0) #round 0.9 - 1.9 to 1
        tmp_internal = np.round(tmp - tmp_cell,3) # getinternal displacement
        df = pd.DataFrame(np.concatenate([tmp_cell,
                                        tmp_internal],
                                        axis=1),
                            columns=[f"{i}_{j}" for j in ["cell", "inner"] for i in list("xyz")])
        
        df[["x_cell", "y_cell", "z_cell"]] = df[["x_cell", "y_cell", "z_cell"]].applymap(lambda x : int(x))
        df["types"] = atoms.symbols
        df["types"] = df["types"].map(lambda x : x.lower())

        box = []
        k = 1
        for i, j in df.groupby(by = ["x_inner", "y_inner", "z_inner"]):
            tmp_df = self.inner_coord_number(j, k)
            box.append(tmp_df)
            k += 1
        df = pd.concat(box)

        return df
    
    def inner_coord_number(self, df, i):
        # TODO Tomo need to change to lattice site name
        df["inner_coord_number"] = i
        return df
    
    def df_merge(self, fill_empty_with="empty"):
        df_original = self.make_dataframe(self.original_atoms, self.repeat)
        df_target = self.make_dataframe(self.target_atoms, self.repeat)
        merged = pd.merge(df_original, df_target, on=["x_cell", "y_cell", "z_cell", "x_inner", "y_inner", "z_inner", "inner_coord_number"], how="left")
        merged["types_y"].fillna(fill_empty_with, inplace=True)
        return merged