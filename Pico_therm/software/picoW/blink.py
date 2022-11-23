# File : blink.py
# Blinking onboard LED on Pico W
# 
# info@pcamus.be
# 22/11/2022

from machine import Pin
import utime

# Uncomment to check version of MicroPython
# import sys
# print ("Interpreter version:")
# print(sys.implementation)

led_onboard = Pin("LED", Pin.OUT)

while True:
    led_onboard.toggle()
    utime.sleep(0.5)
