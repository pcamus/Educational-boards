# file i2c_la.py
# I2C test
# Uses machine.I2C class to generate bus transactions
# for the I2C LCD and display them on the logic analyser
# https://docs.micropython.org/en/latest/library/machine.I2C.html
# author philippe.camus@hepl.be 
# date 24/10/2022

import machine
import pico_i2c_lcd
import utime

synchro = machine.Pin(2, machine.Pin.OUT)
synchro.off()

i2c = machine.I2C(0, sda=machine.Pin(8), scl=machine.Pin(9), freq=400000) 
lcd = pico_i2c_lcd.I2cLcd(i2c, 0x27, 2, 16)

lcd.backlight_on()
 
while(True):
    
    synchro.on()
    utime.sleep_us(10)
    synchro.off()
    
    lcd.putchar("B")
     