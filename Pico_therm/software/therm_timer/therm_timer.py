# file therm_timer.py
# simulation of thermostat
# author philippe.camus@hepl.be 
# date 8/11/2022   

from machine import Timer
from therm_loop_util_v1 import *

ds_sensor, roms, pot, heater_led, ldr, lcd, bckl = hardware_setup()

# Creates 4 Timer objects
timer1 = Timer()
timer2 = Timer()
timer3 = Timer()
timer4 = Timer()

# We group reading, checking and displaying into callaback functions
# a timer object parameter is mandatory (but not used here)
def temp_read_display(timer): 
    global temperature # must be global to be used by heater_test 
    temperature = read_temperature(ds_sensor, roms) 
    display_temperature(temperature, lcd)

def setp_read_display(timer):
    global setpoint # must be global to be used by heater_test
    setpoint = read_setpoint(pot) 
    display_setpoint(setpoint, lcd)

def heater_test(timer):
    if (temperature < setpoint):
        set_heater(1,heater_led)
    else:
        set_heater(0,heater_led)

def lum_read_display(timer):
    luminosity = read_luminosity(ldr) 
    display_luminosity(luminosity, bckl)

# read and display data once before installing timer callbacks 
temperature = read_temperature(ds_sensor, roms) 
display_temperature(temperature, lcd)

setpoint = read_setpoint(pot) 
display_setpoint(setpoint, lcd)

if (temperature < setpoint):
    set_heater(1,heater_led)
else:
    set_heater(0,heater_led)

luminosity = read_luminosity(ldr) 
display_luminosity(luminosity, bckl)

# Installs callbacks. These functions will be called by the timer interrupt code
# each function is initialized with the more appropriate rate
timer1.init(freq=0.5, mode=Timer.PERIODIC, callback=temp_read_display)
timer2.init(freq=2, mode=Timer.PERIODIC, callback=setp_read_display)
timer3.init(freq=1, mode=Timer.PERIODIC, callback=heater_test)
timer4.init(freq=0.25, mode=Timer.PERIODIC, callback=lum_read_display)

