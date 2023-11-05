model_name = '002_FePt_local_interactio'
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
    "J_NN":{"value":"0.0465", "adjustable":True, "min":"0.1", "max":"0.01","scale":"linear"},
    "J_NNN":{"value":"-0.0093", "adjustable":True, "min":"-0.02", "max":"-0.002","scale":"linear"},
    "T":{"value":"1500", "adjustable":True, "min":"0.0", "max":"2000.0","scale":"linear"},
    }

rate_constants = {
    "FePt_interaction_0":("1.00", True),
    "FePt_interaction_1":("1.00", True),
    "FePt_interaction_10":("1.00", True),
    "FePt_interaction_11":("1.00", True),
    "FePt_interaction_2":("1.00", True),
    "FePt_interaction_3":("1.00", True),
    "FePt_interaction_4":("1.00", True),
    "FePt_interaction_5":("1.00", True),
    "FePt_interaction_6":("1.00", True),
    "FePt_interaction_7":("1.00", True),
    "FePt_interaction_8":("1.00", True),
    "FePt_interaction_9":("1.00", True),
    }

site_names = ['fept_origin']
representations = {
    "empty":"""""",
    "fe":"""Atoms('Fe')""",
    "pt":"""Atoms('Pt')""",
    }

lattice_representation = """"""

species_tags = {
    "empty":"""""",
    "fe":"""""",
    "pt":"""""",
    }

tof_count = {
    }

connected_variables={'surroundingSitesDict': {}}
xml = """<?xml version="1.0" ?>
<kmc version="(0, 4)">
    <meta author="Tomoyuki TSUYAMA" email="tomoyuki.tsuyaman@gmail.com" model_name="002_FePt_local_interactio" model_dimension="3" debug="0"/>
    <species_list default_species="empty">
        <species name="empty" representation="" color="" tags=""/>
        <species name="fe" representation="Atoms('Fe')" color="" tags=""/>
        <species name="pt" representation="Atoms('Pt')" color="" tags=""/>
    </species_list>
    <parameter_list>
        <parameter name="J_NN" value="0.0465" adjustable="True" min="0.1" max="0.01" scale="linear"/>
        <parameter name="J_NNN" value="-0.0093" adjustable="True" min="-0.02" max="-0.002" scale="linear"/>
        <parameter name="T" value="1500" adjustable="True" min="0.0" max="2000.0" scale="linear"/>
    </parameter_list>
    <lattice cell_size="1.9245 0.0 0.0 0.0 1.9245 0.0 0.0 0.0 1.85" default_layer="fept" substrate_layer="fept" representation="">
        <layer name="fept" color="#ffffff">
            <site pos="0.0 0.0 0.0" type="origin" tags="" default_species="Fe"/>
        </layer>
    </lattice>
    <process_list>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_0" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -3 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 -1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_1" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-3 0 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_10" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="1 0 1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="3 0 1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_11" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="1 1 0"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 -2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 3 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="3 1 0" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_2" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-3 -1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -3 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 -2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_3" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -3 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_4" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="3 0 -1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_5" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-3 1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 -2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 3 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_6" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 -2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 3 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 -1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_7" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-3 0 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -2 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_8" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 -1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 -1 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -3 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 -2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 2" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="3 -1 0" flag="nnnbase"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate * min(1.00,                 exp(beta *                     (                         J_NN * 2 * (nr_fe_nnori - nr_pt_nnori - (nr_fe_nnbase - nr_pt_nnbase))                         +                         J_NNN * 2 * (nr_fe_nnnori - nr_pt_nnnori - (nr_fe_nnnbase - nr_pt_nnnbase))                     ) *eV                 )             )            " name="FePt_interaction_9" enabled="True">
            <condition species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <condition species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 1"/>
            <action species="pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 0"/>
            <action species="fe" coord_layer="fept" coord_name="origin" coord_offset="0 1 1"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 -1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 -1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-1 2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 0 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 0" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 1 2" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="1 2 1" flag="nnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 -2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 0 2" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 2 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 0 0" flag="nnnori"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="-2 1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 -1 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 -1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 1 3" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="0 3 1" flag="nnnbase"/>
            <bystander allowed_species="fe pt" coord_layer="fept" coord_name="origin" coord_offset="2 1 1" flag="nnnbase"/>
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
