model_name = '003_Ru_local_interactio'
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
    "T":{"value":"1500", "adjustable":True, "min":"0.0", "max":"2000.0","scale":"linear"},
    "de_act":{"value":"0.1", "adjustable":True, "min":"0.0001", "max":"10.0","scale":"linear"},
    "ips_per_n":{"value":"-0.02", "adjustable":True, "min":"-1.0", "max":"-0.0001","scale":"linear"},
    }

rate_constants = {
    "ru_interaction_0":("1.00", True),
    "ru_interaction_1":("1.00", True),
    "ru_interaction_10":("1.00", True),
    "ru_interaction_11":("1.00", True),
    "ru_interaction_12":("1.00", True),
    "ru_interaction_13":("1.00", True),
    "ru_interaction_14":("1.00", True),
    "ru_interaction_15":("1.00", True),
    "ru_interaction_16":("1.00", True),
    "ru_interaction_17":("1.00", True),
    "ru_interaction_18":("1.00", True),
    "ru_interaction_19":("1.00", True),
    "ru_interaction_2":("1.00", True),
    "ru_interaction_20":("1.00", True),
    "ru_interaction_21":("1.00", True),
    "ru_interaction_22":("1.00", True),
    "ru_interaction_23":("1.00", True),
    "ru_interaction_3":("1.00", True),
    "ru_interaction_4":("1.00", True),
    "ru_interaction_5":("1.00", True),
    "ru_interaction_6":("1.00", True),
    "ru_interaction_7":("1.00", True),
    "ru_interaction_8":("1.00", True),
    "ru_interaction_9":("1.00", True),
    }

site_names = ['ru_slab_p1', 'ru_slab_p2']
representations = {
    "at":"""Atoms('At')""",
    "empty":"""""",
    "rn":"""Atoms('Rn')""",
    "ru":"""Atoms('Ru')""",
    }

lattice_representation = """"""

species_tags = {
    "at":"""""",
    "empty":"""""",
    "rn":"""""",
    "ru":"""""",
    }

tof_count = {
    }

connected_variables={'surroundingSitesDict': {}}
xml = """<?xml version="1.0" ?>
<kmc version="(0, 4)">
    <meta author="Tomoyuki TSUYAMA" email="tomoyuki.tsuyaman@gmail.com" model_name="003_Ru_local_interactio" model_dimension="3" debug="0"/>
    <species_list default_species="empty">
        <species name="at" representation="Atoms('At')" color="" tags=""/>
        <species name="empty" representation="" color="" tags=""/>
        <species name="rn" representation="Atoms('Rn')" color="" tags=""/>
        <species name="ru" representation="Atoms('Ru')" color="" tags=""/>
    </species_list>
    <parameter_list>
        <parameter name="T" value="1500" adjustable="True" min="0.0" max="2000.0" scale="linear"/>
        <parameter name="de_act" value="0.1" adjustable="True" min="0.0001" max="10.0" scale="linear"/>
        <parameter name="ips_per_n" value="-0.02" adjustable="True" min="-1.0" max="-0.0001" scale="linear"/>
    </parameter_list>
    <lattice cell_size="2.69844 0.0 0.0 -1.3492199999999994 2.336917590588081 0.0 0.0 0.0 4.27305" default_layer="ru_slab" substrate_layer="ru_slab" representation="">
        <layer name="ru_slab" color="#ffffff">
            <site pos="0.0 0.0 0.0" type="p1" tags="" default_species="ru"/>
            <site pos="0.33333 0.66666 0.5" type="p2" tags="" default_species="ru"/>
        </layer>
    </lattice>
    <process_list>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_0" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-2 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_1" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-2 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_10" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_11" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_12" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_13" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_14" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_15" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_16" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="2 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_17" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="2 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 2 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_18" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_19" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_2" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_20" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_21" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_22" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_23" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 2 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_3" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_4" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_5" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="2 2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 1 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_6" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 -1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_7" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-2 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_8" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -2 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 -1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
        </process>
        <process rate_constant="1.00" otf_rate="base_rate *             exp(-beta * (de_act + (nr_ru_n1ts - nr_ru_n1org) * ips_per_n )*eV) *             (1 / (1 + exp(-1e30 *(nr_ru_n1ts - 1/2)) ) ) *             exp(beta * (nr_rn_n1ts - nr_rn_n1org)* 1 *eV)             " name="ru_interaction_9" enabled="True">
            <condition species="ru" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <condition species="empty" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0"/>
            <action species="ru" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 0"/>
            <action species="empty" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 0"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="-1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -1 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 -1" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1org"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="-1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 -2 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="0 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p2" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 -1 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="0 0 1" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 0" flag="n1ts"/>
            <bystander allowed_species="ru rn" coord_layer="ru_slab" coord_name="p1" coord_offset="1 0 1" flag="n1ts"/>
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
