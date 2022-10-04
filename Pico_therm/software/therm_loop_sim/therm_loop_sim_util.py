# file therm_loop_sim_util.py
# simulation of thermostat
# I/O access routines
# author philippe.camus@hepl.be 
# date 15/8/2021

def hardware_setup():
    print("Hardware setup")
    
def read_temperature():
    print("Read temperature")
    return 20

def display_temperature(temp):
    print("Temperature : ",temp)

def read_setpoint():
    print("Read setpoint")
    return 22

def display_setpoint(setp):
    print("Setpoint : ",setp)

def read_luminosity():
    print("Read luminosity")
    return 50

def display_luminosity(lum):
    print("Luminosity : ",lum)

def set_heater(state):
    if (state==0):
        print("Heater is OFF")
    else:
        print("Heater is ON")

def check_lib():
    hardware_setup()
    temperature = read_temperature() 
    display_temperature(temperature)
    setpoint = read_setpoint() 
    display_setpoint(setpoint)
    luminosity = read_luminosity() 
    display_luminosity(luminosity)
    set_heater(0)
    set_heater(1)

if __name__ == "__main__":
    # execute only if run as the main module (i.e. not an import module)
    check_lib()
