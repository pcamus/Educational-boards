# file bit_banging.py
# Bit banging simple example.
# Function for generating a oneshot PWM signal, frequency = 250 Hz (= 4000 µs)
# and functions to use it in generating a gradual transition to 1 and a gradual transition to 0
# author philippe.camus@hepl.be 
# date 24/10/2022

import machine
import utime

heater_led = machine.Pin(14, machine.Pin.OUT)

# one shot pulse cycle, period = 4000 µs
def pwm_oneshot_bb(output, duty):  # duty cycle variation : 0 to 1 (100%)
    high_time = int(4000 * duty)
    low_time = 4000 - high_time
    output.on()
    utime.sleep_us(high_time)
    output.off()
    utime.sleep_us(low_time)

def prog_on(output):
    duty_list=[1,4,9,16,25,36,49,64,81,100] # quadratic list of increasing duty cycle in %
    start_time=utime.ticks_ms()
    for duty in duty_list:
        duty=duty/100
        # repeats oneshot duty cycle for a 50 ms time
        while utime.ticks_diff(utime.ticks_ms(),start_time)<50:
            pwm_oneshot_bb(output,duty)
        start_time=utime.ticks_ms()
    heater_led.on()

def prog_off(output):
    duty_list=[100,81,64,49,36,25,16,9,4,1] # quadratic list of decreasing duty cycle in %
    start_time=utime.ticks_ms()
    for duty in duty_list:
        duty=duty/100
        # repeats oneshot duty cycle for a 50 ms time
        while utime.ticks_diff(utime.ticks_ms(),start_time)<50:
            pwm_oneshot_bb(output,duty)
        start_time=utime.ticks_ms()
    heater_led.off()


heater_led.off()
utime.sleep_ms(1000)

# test code with a succession of gradual on and gradual off transitions.
while(True):
    prog_on(heater_led)
    utime.sleep_ms(1000)
    prog_off(heater_led)
    utime.sleep_ms(1000)
