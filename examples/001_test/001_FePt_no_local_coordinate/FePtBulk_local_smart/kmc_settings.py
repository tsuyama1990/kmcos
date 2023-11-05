model_name = 'FePtBulk'
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
    "fept_test_process_0":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_1":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_10":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_11":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_12":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_2":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_3":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_4":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_5":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_6":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_7":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_8":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "fept_test_process_9":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    }

rate_constants = {
    "process_1":("fept_test_process_1", True),
    "process_10":("fept_test_process_10", True),
    "process_11":("fept_test_process_11", True),
    "process_12":("fept_test_process_12", True),
    "process_2":("fept_test_process_2", True),
    "process_3":("fept_test_process_3", True),
    "process_4":("fept_test_process_4", True),
    "process_5":("fept_test_process_5", True),
    "process_6":("fept_test_process_6", True),
    "process_7":("fept_test_process_7", True),
    "process_8":("fept_test_process_8", True),
    "process_9":("fept_test_process_9", True),
    }

site_names = ['fept_origin']
representations = {
    "Fe":"""Atoms('Fe')""",
    "Pt":"""Atoms('Pt')""",
    "empty":"""""",
    }

lattice_representation = """"""

species_tags = {
    "Fe":"""""",
    "Pt":"""""",
    "empty":"""""",
    }

tof_count = {
    }

connected_variables={'surroundingSitesDict': {}}
xml = """<?xml version="1.0" ?>
<kmc version="(0, 4)">
    <meta author="Max J. Hoffmann" email="mjhoffmann@gmail.com" model_name="FePtBulk" model_dimension="3" debug="0"/>
    <species_list default_species="empty">
        <species name="Fe" representation="Atoms('Fe')" color="" tags=""/>
        <species name="Pt" representation="Atoms('Pt')" color="" tags=""/>
        <species name="empty" representation="" color="" tags=""/>
    </species_list>
    <parameter_list>
        <parameter name="fept_test_process_0" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_1" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_10" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_11" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_12" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_2" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_3" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_4" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_5" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_6" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_7" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_8" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="fept_test_process_9" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
    </parameter_list>
    <lattice cell_size="1.9245 0.0 0.0 0.0 1.9245 0.0 0.0 0.0 1.85" default_layer="fept" substrate_layer="fept" representation="">
        <layer name="fept" color="#ffffff">
            <site pos="0.0 0.0 0.0" type="origin" tags="" default_species="Fe"/>
        </layer>
    </lattice>
    <process_list>
        <process rate_constant="fept_test_process_1" name="process_1" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_10" name="process_10" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 1 1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_11" name="process_11" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="1 0 1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_12" name="process_12" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="1 1 0"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_2" name="process_2" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_3" name="process_3" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_4" name="process_4" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_5" name="process_5" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_6" name="process_6" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_7" name="process_7" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_8" name="process_8" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="fept_test_process_9" name="process_9" enabled="True">
            <condition species="Fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="Pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0"/>
            <action species="Fe" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0"/>
            <action species="Pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
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
