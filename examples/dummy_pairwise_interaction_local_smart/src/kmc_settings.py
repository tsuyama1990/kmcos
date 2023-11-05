model_name = 'dummy_pairwise_interaction'
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
    "A":{"value":"(3*angstrom)**2", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "E_CO":{"value":"-1", "adjustable":True, "min":"-2.0", "max":"0.0","scale":"linear"},
    "E_CO_nn":{"value":"0.2", "adjustable":True, "min":"-1.0", "max":"1.0","scale":"linear"},
    "T":{"value":"600", "adjustable":True, "min":"300.0", "max":"1500.0","scale":"linear"},
    "p_COgas":{"value":"0.2", "adjustable":True, "min":"1e-13", "max":"1000.0","scale":"log"},
    }

rate_constants = {
    "CO_adsorption":("p_COgas*A*bar/sqrt(2*m_CO*umass/beta)", True),
    "CO_desorption_0":("p_COgas*A*bar/sqrt(2*m_CO*umass/beta)*exp(beta*(E_CO+0*E_CO_nn-mu_COgas)*eV)", True),
