model_name = 'sand_model'
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
    "k_down":{"value":"1000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "k_entry":{"value":"1000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "k_exit":{"value":"1000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "k_left":{"value":"1000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "k_right":{"value":"1000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    "k_up":{"value":"10000.0", "adjustable":True, "min":"1.0", "max":"1000000.0","scale":"log"},
    }

rate_constants = {
    "diffusion_down":("k_down", True),
    "diffusion_down_left":("k_left", True),
    "diffusion_down_right":("k_right", True),
    "diffusion_left":("k_left", True),
    "diffusion_right":("k_right", True),
    "diffusion_up_left":("k_left", True),
    "diffusion_up_right":("k_right", True),
    "entry":("k_entry", True),
    "exit":("k_exit", True),
    }

site_names = ['default_a']
representations = {
    "blocked":"""Atoms('C')""",
    "drain":"""Atoms('Ag')""",
    "empty":"""""",
    "grain":"""Atoms('Si')""",
    "source":"""Atoms('Au')""",
    }

lattice_representation = """"""

species_tags = {
    "blocked":"""""",
    "drain":"""""",
    "empty":"""""",
    "grain":"""""",
    "source":"""""",
    }

tof_count = {
    }

connected_variables={'surroundingSitesDict': {}}
xml = """<?xml version="1.0" ?>
<kmc version="(0, 4)">
    <meta author="Max J. Hoffmann" email="mjhoffmann@gmail.com" model_name="sand_model" model_dimension="2" debug="0"/>
    <species_list default_species="empty">
        <species name="blocked" representation="Atoms('C')" color="" tags=""/>
        <species name="drain" representation="Atoms('Ag')" color="" tags=""/>
        <species name="empty" representation="" color="" tags=""/>
        <species name="grain" representation="Atoms('Si')" color="" tags=""/>
        <species name="source" representation="Atoms('Au')" color="" tags=""/>
    </species_list>
    <parameter_list>
        <parameter name="k_down" value="1000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="k_entry" value="1000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="k_exit" value="1000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="k_left" value="1000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="k_right" value="1000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
        <parameter name="k_up" value="10000.0" adjustable="True" min="1.0" max="1000000.0" scale="log"/>
    </parameter_list>
    <lattice cell_size="3.0 0.0 0.0 0.0 3.0 0.0 0.0 0.0 3.0" default_layer="default" substrate_layer="default" representation="">
        <layer name="default" color="#ffffff">
            <site pos="0.5 0.5 0.5" type="a" tags="" default_species="empty"/>
        </layer>
    </lattice>
    <process_list>
        <process rate_constant="k_down" name="diffusion_down" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="0 -1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="0 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_left" name="diffusion_down_left" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="-1 -1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="-1 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_right" name="diffusion_down_right" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="1 -1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="1 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_left" name="diffusion_left" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="-1 -1 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="-1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="-1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="-1 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_right" name="diffusion_right" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="1 -1 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="1 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_left" name="diffusion_up_left" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="-1 0 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="-1 1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="-1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="-1 1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_right" name="diffusion_up_right" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="1 0 0"/>
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="1 1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="1 0 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="1 1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
        </process>
        <process rate_constant="k_entry" name="entry" enabled="True">
            <condition species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="source" coord_layer="default" coord_name="a" coord_offset="0 1 0"/>
            <action species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <action species="source" coord_layer="default" coord_name="a" coord_offset="0 1 0"/>
        </process>
        <process rate_constant="k_exit" name="exit" enabled="True">
            <condition species="grain" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <condition species="drain" coord_layer="default" coord_name="a" coord_offset="0 -1 0"/>
            <action species="empty" coord_layer="default" coord_name="a" coord_offset="0 0 0"/>
            <action species="drain" coord_layer="default" coord_name="a" coord_offset="0 -1 0"/>
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
