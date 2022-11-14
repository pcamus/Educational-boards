# file neo_bar_graph.py
# Colored bargraph on Neopixel Adafruit 1426 (8 pixels).
# Color map is in the code.
# Easyly adaptable to other size
# author philippe.camus@hepl.be 
# date 14/11/2022
# Adaptated from :
#http://www.pibits.net/code/raspberry-pi-pico-and-neopixel-example-in-micropython.php#codesyntax_1
import array, time
from machine import Pin
 
# Configure the number of WS2812 LEDs, pins and brightness.
NUM_LEDS = 8
PIN_NUM = 1
brightness = 0.05 # from 0 to 1

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
 
# Display a pattern on the LEDs via an array of LED RGB values.
# Array type, see : https://docs.python.org/3/library/array.html
ar = array.array("I",[0]*NUM_LEDS) # type unsigned integer, initialized with a list of 0

def pixels_dimming(ar):
    dimmed_ar = array.array("I", [0]*NUM_LEDS)
    for i,c in enumerate(ar):
        r = int(((c >> 8) & 0xFF) * brightness)
        g = int(((c >> 16) & 0xFF) * brightness)
        b = int((c & 0xFF) * brightness)
        dimmed_ar[i] = (g<<16) + (r<<8) + b
    return dimmed_ar
   

# 24 bit data for each neopixel in the GRB order
def pixel_set(color):
    return (color[1]<<16) + (color[0]<<8) + color[2]
 

# For the bar graph display with 8 pixels
# Color values (add color if necessary)
BLACK = (0, 0, 0)
RED1 = (63, 0, 0)
RED2 = (255, 0, 0)
ORANGE1 = (127, 31,0)
ORANGE2 = (255, 65,0)
YELLOW1 = (63, 37, 0)
YELLOW2 = (255, 150, 0)
BLUE1 = (0, 0, 63)
BLUE2 = (0, 0, 255)

# Colors list for bagraph
# 8 neopixels, modify here for other size
BG0 = (BLUE1, BLACK, BLACK ,BLACK ,BLACK ,BLACK ,BLACK ,BLACK) 
BG1 = (BLUE1, BLUE2, BLACK ,BLACK ,BLACK ,BLACK ,BLACK ,BLACK)
BG2 = (BLUE1, BLUE2, YELLOW1 ,BLACK ,BLACK ,BLACK ,BLACK ,BLACK)
BG3 = (BLUE1, BLUE2, YELLOW1 ,YELLOW2 ,BLACK ,BLACK ,BLACK ,BLACK) 
BG4 = (BLUE1, BLUE2, YELLOW1 ,YELLOW2 ,ORANGE1 ,BLACK ,BLACK ,BLACK)
BG5 = (BLUE1, BLUE2, YELLOW1 ,YELLOW2 ,ORANGE1 ,ORANGE2 ,BLACK ,BLACK) 
BG6 = (BLUE1, BLUE2, YELLOW1 ,YELLOW2 ,ORANGE1 ,ORANGE2 ,RED1 ,BLACK)
BG7 = (BLUE1, BLUE2, YELLOW1 ,YELLOW2 ,ORANGE1 ,ORANGE2 ,RED1 ,RED2) 

BG_LIST= [BG0, BG1, BG2, BG3, BG4, BG5, BG6, BG7] # and also modify the list

# used to test library
def draw_bar_graph(level):
    BG_DISP= BG_LIST[level]
    print(level)
    for i, color in enumerate(BG_DISP):
        ar[i]=pixel_set(color)
        
    dimmed_ar=pixels_dimming(ar)
    
    sm.put(dimmed_ar, 8) # to the PIO FIFO


if __name__ == "__main__":
    # execute only if run as the main module (i.e. not an import module)
    for i in range(8):
        draw_bar_graph(i)
        time.sleep(1)
        
    