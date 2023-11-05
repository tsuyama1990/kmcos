model_name = 'AB_no_diffusion'
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
    "A":{"value":"1.552e-19", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "E_bind_CO":{"value":"-1.9", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "E_bind_O2":{"value":"-2.138", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "E_react":{"value":"0.9", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "T":{"value":"600", "adjustable":False, "min":"0.0", "max":"0.0","scale":"linear"},
    "p_COgas":{"value":"1.0", "adjustable":True, "min":"1e-13", "max":"100.0","scale":"log"},
    "p_O2gas":{"value":"1.0", "adjustable":True, "min":"1e-13", "max":"100.0","scale":"log"},
    }

rate_constants = {
    "AB_react_down":("1/(beta*h)*exp(-beta*E_react*eV)", True),
    "AB_react_left":("1/(beta*h)*exp(-beta*E_react*eV)", True),
    "AB_react_right":("1/(beta*h)*exp(-beta*E_react*eV)", True),
    "AB_react_up":("1/(beta*h)*exp(-beta*E_react*eV)", True),
    "A_adsorption":("p_O2gas*bar*A/sqrt(2*pi*m_O2*umass/beta)", True),
    "A_desorption":("p_O2gas*bar*A/sqrt(2*pi*m_O2*umass/beta)*exp(beta*(E_bind_O2-mu_O2gas)*eV)", True),
