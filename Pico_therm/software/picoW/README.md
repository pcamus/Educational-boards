## Using the Raspberry Pi Pico W to get data from the web.

The first thing to do is to install the specific MicroPython interpreter into the Pico : https://www.raspberrypi.com/documentation/microcontrollers/micropython.html

Then run the [blink.py](blink.py) program to test if all is fine. Note that the onboard LED is no more connected to the GPIO25 port but to the WiFi chip. To access it, use the name "LED" for the pin number and the interpreter will call an appropriate piece of code to access the LED.

To check the wifi connection, use the [test_wifi.py](test_wifi.py) code. The network identifier, API, keys and other passwords are kept separately, in a file called [secrets.py](secrets.py).

To read a web page (here to call the Opneweathermap API) use the [owm_picow.py](owm_picow.py) code. And enjoy the weather conditions !

*See here for a web server application: https://projects.raspberrypi.org/en/projects/get-started-pico-w/2*
