# file therm_loop_sim.py
# simulation of thermostat
# author philippe.camus@hepl.be 
# date 15/8/2021   

from therm_loop_sim_util import *
import time

hardware_setup()
print()

while(True):
    temperature = read_temperature() 
    display_temperature(temperature)

    setpoint = read_setpoint() 
    display_setpoint(setpoint)

    if (temperature < setpoint):
        set_heater(1)
    else:
        set_heater(0)
   
    luminosity = read_luminosity() 
    display_luminosity(luminosity) 

    time.sleep(2.5)
    print()
