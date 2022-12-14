## Object orientation.

This is a first introduction on how to transform an embedded peripheral device in a software object. 

We use the [joy_it I2C LCD module](https://joy-it.net/en/products/SBC-LCD16x2) as an example.

The description of the LCD object is the following:

![](lcd_oo.jpg)

A brief reminder of the object oriented programming in Python with a reference to a web tutorial is given in the [OOprog.pdf](OOprog.pdf) file.

A basic description of the I2C protocol is also given: [I2C.pdf](I2C.pdf).

The files used for the LCD modules are [here](https://github.com/pcamus/Educational-boards/tree/main/Pico_therm/software/therm_loop_v1).

The scematic of the I2C to LCD interface board is the following:

![](i2c_to_lcd_brd.jpg)

A visualization with the logic analizer of the I2C transaction when writing a single character with [i2c_la.py](i2c_la.py) is given below:

![](i2c_lcd.jpg)
