# file therm_loop_v1.py
# simulation of thermostat
# author philippe.camus@hepl.be 
# date 21/8/2021   

import time
from therm_loop_util_v1 import *
#from neo_bar_graph import *

ds_sensor, roms, pot, heater_led, ldr,lcd,bckl = hardware_setup()

#probe_pin = machine.Pin(0,machine.Pin.OUT) # to check loop timing
#probe_pin.value(0)

print()

while(True):
#    probe_pin.value(1) # // 1 level = loop duration
    
    temperature = read_temperature(ds_sensor, roms) 
    display_temperature(temperature, lcd)

    setpoint = read_setpoint(pot) 
    display_setpoint(setpoint, lcd)
    #draw_bar_graph(setpoint-4)

    if (temperature < setpoint):
        set_heater(1,heater_led)
    else:
        set_heater(0,heater_led)
   
    luminosity = read_luminosity(ldr) 
    display_luminosity(luminosity, bckl) 

#    probe_pin.value(0)
    
    time.sleep(1)
    #print()
