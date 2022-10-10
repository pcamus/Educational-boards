import machine, onewire, ds18x20, time
# ds18x20.py
# https://github.com/micropython/micropython/blob/master/drivers/onewire/ds18x20.py
# DHT11 PIO driver https://www.raspberrypi.org/forums/viewtopic.php?t=303606

ds_pin = machine.Pin(22)
ds_sensor = ds18x20.DS18X20(onewire.OneWire(ds_pin))
    
roms = ds_sensor.scan() # list of ds18x20 connected
print('Found DS devices: ', roms)
    
while True:
   ds_sensor.convert_temp() # initiates temp conversion
   time.sleep_ms(750) # min 750 ms for conversion
   print(round(ds_sensor.read_temp(roms[0]),2))
#    for rom in roms:
#        print(rom)
#        print(round(ds_sensor.read_temp(rom),2))
   time.sleep(2) # again after 2 s