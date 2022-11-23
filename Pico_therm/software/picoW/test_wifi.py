# File : test_wifi.py
# Testing the connection to a WiFi access point (AP) with the Pico W
# https://how2electronics.com/raspberry-pi-pico-w-web-server-tutorial-with-micropython/
# https://docs.micropython.org/en/latest/library/network.WLAN.html
#
# network.status codes :
# network.STAT_IDLE = 0
# network.STAT_CONNECTING = 1
# network.STAT_GOT_IP = 3
# 
# network.STAT_CONNECT_FAIL = -1
# network.STAT_NO_AP_FOUND = -2
# network.STAT_WRONG_PASSWORD = -3
#
# info@pcamus.be
# 23/11/2022

import urequests, network
from secrets import *
import utime

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.connect(my_secrets["ssid"],my_secrets["WiFi_pass"])

print("Trying to connect to WiFi...")

# Waits for connection or exit with error code if it fails
retry = 10
while (retry > 0):
    wlan_stat=wlan.status()
    if wlan_stat==0:
        print("Interface in idle state")
    if wlan_stat==1:
        print("Connection trial...")    
    if wlan_stat==3:
        print("Got IP")
        break
    if wlan_stat==-1:
        raise RuntimeError('WiFi connection failed')
    if wlan_stat==-2:
        raise RuntimeError('No AP found')    
    if wlan_stat==-3:
        raise RuntimeError('Wrong WiFi password')
    
    if wlan.status() < 0 or wlan.status() >= 3:
        break
    retry = retry-1
    utime.sleep(1)

if wlan_stat!=3:
    raise RuntimeError('WiFi connection failed')


print()
print('Connected to WiFi network: ',end="")
print(wlan.config("ssid"))
print()
ip=wlan.ifconfig()
print("IP info (IP address, mask, gateway, DNS):")
print(ip)

# Now we can use the IP address to establish a socket connection and use an application protocol.


