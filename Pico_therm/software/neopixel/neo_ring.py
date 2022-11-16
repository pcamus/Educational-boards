# file neo_ringh.py
# Colored ring on Neopixel ring (16 pixels).
# Connect VCC of neopixel to 5 V to avoid overcurrent on the 3.3V line
# author philippe.camus@hepl.be 
# date 14/11/2022
# Adaptated from :
#http://www.pibits.net/code/raspberry-pi-pico-and-neopixel-example-in-micropython.php#codesyntax_1
import array, time
from machine import Pin
from color_map import *
 
# Configure the number of WS2812 LEDs, pins and brightness.
NUM_LEDS = 16
PIN_NUM = 1
brightness = 0.01 # from 0 to 1 -> take care, 1 is very bright!

#Neopixel protocol is controlled by a pio machine
@rp2.asm_pio(sideset_init=rp2.PIO.OUT_LOW, out_shiftdir=rp2.PIO.SHIFT_LEFT, autopull=True, pull_thresh=24)
def ws2812():
    T1 = 2
    T2 = 5
    T3 = 3
    wrap_target()
    label("bitloop")
    out(x, 1)               .side(0)    [T3 - 1]
    jmp(not_x, "do_zero")   .side(1)    [T1 - 1]
    jmp("bitloop")          .side(1)    [T2 - 1]
    label("do_zero")
    nop()                   .side(0)    [T2 - 1]
    wrap()
 
 
# Create the StateMachine with the ws2812 program, outputting on Pin(PIN_NUM).
sm = rp2.StateMachine(0, ws2812, freq=8_000_000, sideset_base=Pin(PIN_NUM))
 
# Start the StateMachine, it will wait for data on its FIFO.
sm.active(1)


# 24 bit data for each neopixel in the GRB order
def pixel_set_and_dim(color, brightness):
    green=int(color[1]*brightness)
    red=int(color[0]*brightness)
    blue=int(color[2]*brightness)
    result= (green<<16)+(red<<8)+blue
    return result

# Colors list for ring (see color_map.py)
RING_LIST = [NAVY,MEDIUM_BLUE,BLUE,ROYAL_BLUE,LIGHT_YELLOW,CORN_SILK,YELLOW,GOLD, \
             LIGHT_ORANGE,ORANGE,DARK_ORANGE,CHOCOLATE,ORANGE_RED,RED,CRIMSON,PURPLE]

BLACK = (0, 0, 0)


# Creates an array with the 24 bits value of GRB (Green, Red, Blue) for all pixels and sends it to the PIO
def draw_ring(ring,num_leds):
    # Creates an array, type of elements: unsigned integer,
    # initialized with a zeroed list of num_leds size
    # Array type, see : https://docs.python.org/3/library/array.html
    ar = array.array("I",[0]*num_leds)
    for i, color in enumerate(ring):
        ar[i]=pixel_set_and_dim(color,brightness)

    sm.put(ar, 8) # pushes a word of data to the state machine
    # second parameter indicates a shift value for each pushed data (from ar).
    # data is coded with 32 bits, so the value pushes the 24 bits at the right position.


def build_partial_ring(mini, maxi, ring_list,num_leds):
    par_ring = [0]*num_leds # creates a zeroed list of num_leds size
    for i in range(mini):
        par_ring[i]=BLACK
    for i in range(mini,maxi):
        par_ring[i]=ring_list[i]
    for i in range(maxi,NUM_LEDS):
        par_ring[i]=BLACK
    return par_ring

if __name__ == "__main__":
    # execute only if run as the main module (i.e. not an import module)
    
    # Demo 1: display a range of pixel from min to max and blink a pixel
    min = 5
    max = 14
    blink= 10
    for i in range(10):
        ring=build_partial_ring(min, max, RING_LIST, NUM_LEDS)
        draw_ring(ring, NUM_LEDS)
        time.sleep(0.5)
        ring[blink]=BLACK # to blink choose BLACK for the pixel
        draw_ring(ring, NUM_LEDS)
        time.sleep(0.5)
    
    # Demo 2: running pixel
    for i in range(10):
        ring=build_partial_ring(i, i+1, RING_LIST, NUM_LEDS)
        time.sleep(0.5)
        draw_ring(ring, NUM_LEDS)
    
    # Demo 3: displays all pixels
    ring=build_partial_ring(0, 16, RING_LIST, NUM_LEDS) # complete ring
    draw_ring(ring, NUM_LEDS)
    time.sleep(1)
    
    # Demo 4: varies dimming of all pixels
    brightness=0.1
    for i in range(10):
        ring=build_partial_ring(0, 16, RING_LIST, NUM_LEDS) # complete ring
        draw_ring(ring, NUM_LEDS)
        brightness=brightness-0.01
        time.sleep(0.5)
        
        