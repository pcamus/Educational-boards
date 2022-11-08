# file therm_loop_util_v1.py
# simulation of thermostat
# I/O access routines
# author philippe.camus@hepl.be 
# date 21/8/2021

import machine, onewire, ds18x20
import pico_i2c_lcd
import utime

def hardware_setup():
    print("Hardware setup")
    ds_pin = machine.Pin(22)
    ds_sensor = ds18x20.DS18X20(onewire.OneWire(ds_pin))
    roms = ds_sensor.scan() # list of ds18x20 connected
    
    pot = machine.ADC(0)
    heater_led = machine.Pin(14, machine.Pin.OUT)
    ldr = machine.ADC(1)
    
    i2c = machine.I2C(0, sda=machine.Pin(8), scl=machine.Pin(9), freq=400000) 
    lcd = pico_i2c_lcd.I2cLcd(i2c, 0x27, 2, 16)
    
    lcd.backlight_on()
        
    bckl = machine.PWM(machine.Pin(15))
    bckl.freq(1000)
    bckl.duty_u16(32768)
    
    lcd.move_to(1,0)
    lcd.putstr("Hardware setup")
        
    utime.sleep(1.5)
    return ds_sensor, roms, pot, heater_led, ldr, lcd, bckl
    
def read_temperature(ds_sensor, roms):
    #print("Read temperature")
    ds_sensor.convert_temp() # initiates temp conversion
    return int(ds_sensor.read_temp(roms[0]))

def display_temperature(temp,lcd):
    #print("Temperature : ",temp)
    lcd.move_to(0,0)
    lcd.putstr("Temperature:   ")
    lcd.move_to(13,0)
    lcd.putstr(str(temp))
    
def read_setpoint(pot):
    #print("Read setpoint")
    return int((pot.read_u16()/2047)+4)

def display_setpoint(setp,lcd):
    #print("Setpoint : ",setp)
    lcd.move_to(0,1)
    lcd.putstr("Setpoint:   ")
    lcd.move_to(10,1)
    lcd.putstr(str(setp))

def read_luminosity(ldr):
    #print("Read luminosity")
    return int((ldr.read_u16()/65535)*100)

def display_luminosity(lum,bckl):
    #print("Luminosity : ",lum)
    bckl.duty_u16(lum*655)

def set_heater(state,heater_led):
    if (state==0):
        #print("Heater is OFF")
        heater_led.value(0)   
    else:
        #print("Heater is ON")
        heater_led.value(1)

def check_lib():
    ds_sensor, roms,pot,heater_led, ldr,lcd, bckl = hardware_setup()
    temperature = read_temperature(ds_sensor, roms) 
    display_temperature(temperature,lcd)
    setpoint = read_setpoint(pot) 
    display_setpoint(setpoint,lcd)
    luminosity = read_luminosity(ldr) 
    display_luminosity(luminosity,bckl)
    set_heater(0,heater_led)
    set_heater(1,heater_led)

if __name__ == "__main__":
    # execute only if run as the main module (i.e. not an import module)
    check_lib()
