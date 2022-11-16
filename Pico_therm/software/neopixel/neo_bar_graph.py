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
import rp2
 
# Configure the number of WS2812 LEDs, pins and brightness.
NUM_LEDS = 8
PIN_NUM = 1
brightness = 0.05 # from 0 to 1

#Neopixel protocol is controlled by a pio machine
# Genral Info about rp2: https://docs.micropython.org/en/latest/library/rp2.html#module-rp2
# Specific info for RP2040 : https://docs.micropython.org/en/latest/library/rp2.StateMachine.html
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

# 24 bit data for each neopixel in the GRB order
def pixel_set_and_dim(color, brightness):
    green=int(color[1]*brightness)
    red=int(color[0]*brightness)
    blue=int(color[2]*brightness)
    result= (green<<16)+(red<<8)+blue
    return result

# Used to test library : draws successively all the possible bars
def draw_bar_graph(bar):
    # Array type, see : https://docs.python.org/3/library/array.html
    ar = array.array("I",[0]*NUM_LEDS) # type unsigned integer, initialized with a list of 0

    for i, color in enumerate(bar):
        ar[i]=pixel_set_and_dim(color,brightness)
        
    sm.put(ar, 8) # pushes a word of data to the state machine
    # second parameter indicates a shift value for each pushed data (from ar).
    # data is coded with 32 bits, so the value pushes the 24 bits at the right position.

if __name__ == "__main__":
    # execute only if run as the main module (i.e. not an import module)
    for i in range(8):
        draw_bar_graph(BG_LIST[i])
        time.sleep(1)
       
