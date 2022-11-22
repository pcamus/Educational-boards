# File : servo.py
# Simple servo program using pwm
# https://microcontrollerslab.com/servo-motor-raspberry-pi-pico-micropython/
# info@pcamus.be
# 22/11/2022

from machine import Pin, PWM
import utime

pwm = PWM(Pin(22)) # My servo is connected to pin 22
pwm.freq(50)

# Uncomment this loop to check for servo travel range
# while True:
#     pwm.duty_u16(1900)
#     utime.sleep(2)
# 
#     pwm.duty_u16(8500)
#     utime.sleep(2)

min_trav = 1900
max_trav = 8500
neutral = int(min_trav+(max_trav-min_trav)/2)
pwm.duty_u16(neutral)
utime.sleep(5)

pwm.duty_u16(min_trav)
utime.sleep(0.5)

while True:
    for position in range(min_trav,max_trav,50):
        pwm.duty_u16(position)
        utime.sleep(0.01)
    utime.sleep(1)
    for position in range(max_trav,min_trav,-50):
        pwm.duty_u16(position)
        utime.sleep(0.01)
    utime.sleep(1)