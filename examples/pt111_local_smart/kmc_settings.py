model_name = 'pt111'
simulation_size = 20 #TODO: A. Savara found on 12/04/22 that this is hardcoded in io.py, and it should not be hardcoded. 
random_seed = 1 #TODO: A. Savara found on 12/04/22 that this is hardcoded in io.py, and it should not be hardcoded.

def setup_model(model):
    """ Aug 15th 2022: setup_model is legacy code. Please ignore the rest of this comment and this function. 
    Write initialization steps here.
       e.g. ::
    model.put([0,0,0,model.lattice.default_a], model.proclist.species_a)
    """
    #from setup_model import setup_model
    #setup_model(model)
    pass

# Default history length in graph
hist_length = 30

parameters = {
    "T":{"value":"600", "adjustable":True, "min":"300.0", "max":"800.0","scale":"linear"},
    }

rate_constants = {
    "H_adsorption_hollow1":("100000", True),
    "H_adsorption_hollow2":("100000", True),
    "H_desorption_hollow1":("100000", True),
    "H_desorption_hollow2":("100000", True),
    "H_diff_h1h2":("1000000000", True),
    "H_diff_h2h1":("1000000000", True),
    }

site_names = ['pt111_hollow1', 'pt111_hollow2']
representations = {
    "H":"""Atoms('H')""",
    "empty":"""""",
    }

lattice_representation = """[Atoms(symbols='Pt4',
          pbc=np.array([ True,  True, False]),
          cell=np.array(      ([[2.77185858, 0.0, 0.0], [1.38592929, 2.40049995, 0.0], [0.0, 0.0, 26.78963917]])),
          scaled_positions=np.array(      [[0.0, 0.0, 0.3732786], [0.3333333, 0.3333333, 0.4577595], [0.6666667, 0.6666667, 0.5422405], [0.0, 0.0, 0.6267214]]),
),]"""

species_tags = {
    "H":"""""",
    "empty":"""""",
    }

tof_count = {
    }

connected_variables={'surroundingSitesDict': {}}
xml = """<?xml version="1.0" ?>
<kmc version="(0, 4)">
    <meta author="Max J. Hoffmann" email="mjhoffmann@gmail.com" model_name="pt111" model_dimension="2" debug="0"/>
    <species_list default_species="empty">
        <species name="H" representation="Atoms('H')" color="#ffff00" tags=""/>
        <species name="empty" representation="" color="#ffffff" tags=""/>
    </species_list>
    <parameter_list>
        <parameter name="T" value="600" adjustable="True" min="300.0" max="800.0" scale="linear"/>
    </parameter_list>
    <lattice cell_size="2.77185858 0.0 0.0 1.38592929 2.40049995 0.0 0.0 0.0 26.78963917" default_layer="pt111" substrate_layer="pt111" representation="[Atoms(symbols='Pt4',
          pbc=np.array([ True,  True, False]),
          cell=np.array(      ([[2.77185858, 0.0, 0.0], [1.38592929, 2.40049995, 0.0], [0.0, 0.0, 26.78963917]])),
          scaled_positions=np.array(      [[0.0, 0.0, 0.3732786], [0.3333333, 0.3333333, 0.4577595], [0.6666667, 0.6666667, 0.5422405], [0.0, 0.0, 0.6267214]]),
),]">
        <layer name="pt111" color="#ffffff">
            <site pos="0.333333333333 0.333333333333 0.672" type="hollow1" tags="" default_species="default_species"/>
            <site pos="0.666666666667 0.666666666667 0.672" type="hollow2" tags="" default_species="default_species"/>
        </layer>
    </lattice>
    <process_list>
        <process rate_constant="100000" name="H_adsorption_hollow1" enabled="True">
            <condition species="empty" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
            <action species="H" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="100000" name="H_adsorption_hollow2" enabled="True">
            <condition species="empty" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
            <action species="H" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="100000" name="H_desorption_hollow1" enabled="True">
            <condition species="H" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="100000" name="H_desorption_hollow2" enabled="True">
            <condition species="H" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="1000000000" name="H_diff_h1h2" enabled="True">
            <condition species="H" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
            <action species="H" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="1000000000" name="H_diff_h2h1" enabled="True">
            <condition species="H" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="pt111" coord_name="hollow2" coord_offset="0 0 0"/>
            <action species="H" coord_layer="pt111" coord_name="hollow1" coord_offset="0 0 0"/>
        </process>
    </process_list>
    <output_list/>
    <connected_variables connected_variables_string="{'surroundingSitesDict': {}}"/>
</kmc>
"""
if __name__ == "__main__":
    #benchmark if kmc_settings.py is run without additional arguments, else call cli with additional argument provided.
    import sys
    if len(sys.argv) == 1:
        from kmcos import cli
        cli.main("benchmark")
    if len(sys.argv) == 2:
        from kmcos import cli
        cli.main(sys.argv[1])
