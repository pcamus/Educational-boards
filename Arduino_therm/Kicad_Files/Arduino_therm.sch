EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Arduino Thermostat"
Date "2021-09-06"
Rev ""
Comp "HEPL"
Comment1 "philippe.camus@hepl.be"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 6135E1C7
P 3850 3350
F 0 "A1" H 3850 4700 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 3850 4800 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3_topv" H 3850 3350 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 3850 3350 50  0001 C CNN
	1    3850 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 6135F085
P 5650 3200
F 0 "D1" V 5700 3050 50  0000 C CNN
F 1 "LED" V 5600 3050 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5650 3200 50  0001 C CNN
F 3 "~" H 5650 3200 50  0001 C CNN
	1    5650 3200
	0    -1   -1   0   
$EndComp
$Comp
L Sensor_Optical:LDR07 LDR1
U 1 1 613612FE
P 5650 4100
F 0 "LDR1" H 5720 4146 50  0000 L CNN
F 1 "LDR07" H 5720 4055 50  0000 L CNN
F 2 "OptoDevice:R_LDR_5.1x4.3mm_P3.4mm_Vertical" V 5825 4100 50  0001 C CNN
F 3 "http://www.tme.eu/de/Document/f2e3ad76a925811312d226c31da4cd7e/LDR07.pdf" H 5650 4050 50  0001 C CNN
	1    5650 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 6136272C
P 5650 4500
F 0 "R2" H 5718 4546 50  0000 L CNN
F 1 "10k" H 5718 4455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5690 4490 50  0001 C CNN
F 3 "~" H 5650 4500 50  0001 C CNN
	1    5650 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 6136367C
P 5650 2800
F 0 "R1" H 5718 2846 50  0000 L CNN
F 1 "820R" H 5718 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5690 2790 50  0001 C CNN
F 3 "~" H 5650 2800 50  0001 C CNN
	1    5650 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 613648C3
P 1550 2500
F 0 "J1" H 1658 2781 50  0000 C CNN
F 1 "Setpoint" H 1658 2690 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1550 2500 50  0001 C CNN
F 3 "~" H 1550 2500 50  0001 C CNN
	1    1550 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 613653B2
P 1550 3300
F 0 "J2" H 1658 3581 50  0000 C CNN
F 1 "Temperature" H 1658 3490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1550 3300 50  0001 C CNN
F 3 "~" H 1550 3300 50  0001 C CNN
	1    1550 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 61365C15
P 1600 4250
F 0 "J3" H 1708 4531 50  0000 C CNN
F 1 "LCD" H 1708 4440 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1600 4250 50  0001 C CNN
F 3 "~" H 1600 4250 50  0001 C CNN
	1    1600 4250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 61361D6E
P 5500 5250
F 0 "J4" H 5472 5182 50  0000 R CNN
F 1 "LCD Backlight" H 5472 5273 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5500 5250 50  0001 C CNN
F 3 "~" H 5500 5250 50  0001 C CNN
	1    5500 5250
	-1   0    0    1   
$EndComp
Text Label 5350 2600 0    50   ~ 0
Heater
Wire Wire Line
	5650 4250 5650 4300
Wire Wire Line
	5650 4300 5300 4300
Connection ~ 5650 4300
Wire Wire Line
	5650 4300 5650 4350
Text Label 5300 4300 0    50   ~ 0
LDR
Wire Wire Line
	4850 5250 5300 5250
Text Label 4850 5250 0    50   ~ 0
Backlight
$Comp
L power:GND #PWR0102
U 1 1 6136D70D
P 5650 4650
F 0 "#PWR0102" H 5650 4400 50  0001 C CNN
F 1 "GND" H 5655 4477 50  0000 C CNN
F 2 "" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 6136DFE5
P 5650 3950
F 0 "#PWR0103" H 5650 3800 50  0001 C CNN
F 1 "VCC" H 5665 4123 50  0000 C CNN
F 2 "" H 5650 3950 50  0001 C CNN
F 3 "" H 5650 3950 50  0001 C CNN
	1    5650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3450 4800 3450
Wire Wire Line
	4350 3350 4800 3350
Text Label 4650 3450 0    50   ~ 0
LDR
Text Label 4650 3350 0    50   ~ 0
POT
Wire Wire Line
	3350 2950 2850 2950
Wire Wire Line
	3350 3650 2850 3650
Text Label 2850 2950 0    50   ~ 0
Backlight
Text Label 2850 3650 0    50   ~ 0
Heater
Wire Wire Line
	1750 2400 2100 2400
Wire Wire Line
	1750 2600 2100 2600
Wire Wire Line
	1750 3200 2100 3200
Wire Wire Line
	1750 3400 2100 3400
Wire Wire Line
	1800 4150 1950 4150
Wire Wire Line
	1800 4350 2100 4350
Wire Wire Line
	1800 4450 2100 4450
$Comp
L power:GND #PWR0107
U 1 1 6137F4F9
P 3750 4650
F 0 "#PWR0107" H 3750 4400 50  0001 C CNN
F 1 "GND" H 3755 4477 50  0000 C CNN
F 2 "" H 3750 4650 50  0001 C CNN
F 3 "" H 3750 4650 50  0001 C CNN
	1    3750 4650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0108
U 1 1 61382373
P 4050 2350
F 0 "#PWR0108" H 4050 2200 50  0001 C CNN
F 1 "VCC" H 4065 2523 50  0000 C CNN
F 2 "" H 4050 2350 50  0001 C CNN
F 3 "" H 4050 2350 50  0001 C CNN
	1    4050 2350
	1    0    0    -1  
$EndComp
NoConn ~ 3750 2350
NoConn ~ 3950 2350
NoConn ~ 3350 2750
NoConn ~ 3350 2850
NoConn ~ 3350 3050
NoConn ~ 3350 3150
NoConn ~ 3350 3250
NoConn ~ 3350 3350
NoConn ~ 3350 3450
NoConn ~ 3350 3550
NoConn ~ 3350 3850
NoConn ~ 3350 3950
NoConn ~ 3350 4050
$Comp
L power:VCC #PWR0109
U 1 1 61386A14
P 2100 2400
F 0 "#PWR0109" H 2100 2250 50  0001 C CNN
F 1 "VCC" H 2115 2573 50  0000 C CNN
F 2 "" H 2100 2400 50  0001 C CNN
F 3 "" H 2100 2400 50  0001 C CNN
	1    2100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 61387514
P 2300 3300
F 0 "#PWR0110" H 2300 3150 50  0001 C CNN
F 1 "VCC" H 2315 3473 50  0000 C CNN
F 2 "" H 2300 3300 50  0001 C CNN
F 3 "" H 2300 3300 50  0001 C CNN
	1    2300 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61387D40
P 2100 3400
F 0 "#PWR0111" H 2100 3150 50  0001 C CNN
F 1 "GND" H 2105 3227 50  0000 C CNN
F 2 "" H 2100 3400 50  0001 C CNN
F 3 "" H 2100 3400 50  0001 C CNN
	1    2100 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 61388221
P 2300 2500
F 0 "#PWR0112" H 2300 2250 50  0001 C CNN
F 1 "GND" H 2305 2327 50  0000 C CNN
F 2 "" H 2300 2500 50  0001 C CNN
F 3 "" H 2300 2500 50  0001 C CNN
	1    2300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2500 2300 2500
Wire Wire Line
	1750 3300 2300 3300
Wire Wire Line
	3350 3750 2850 3750
Text Label 2850 3750 0    50   ~ 0
Onewire
Text Label 1800 3200 0    50   ~ 0
Onewire
Text Label 1950 2600 0    50   ~ 0
POT
Wire Wire Line
	1800 4250 2100 4250
Text Label 1950 4350 0    50   ~ 0
SDA
Text Label 1950 4450 0    50   ~ 0
SCL
NoConn ~ 4350 2750
NoConn ~ 4350 2950
NoConn ~ 4350 3150
NoConn ~ 4350 3550
NoConn ~ 4350 3650
NoConn ~ 4350 3750
NoConn ~ 4350 3850
Wire Wire Line
	4350 4050 4800 4050
Wire Wire Line
	4350 4150 4800 4150
Text Label 4650 4050 0    50   ~ 0
SDA
Text Label 4650 4150 0    50   ~ 0
SCL
$Comp
L power:GND #PWR0101
U 1 1 6136C796
P 5650 3350
F 0 "#PWR0101" H 5650 3100 50  0001 C CNN
F 1 "GND" H 5655 3177 50  0000 C CNN
F 2 "" H 5650 3350 50  0001 C CNN
F 3 "" H 5650 3350 50  0001 C CNN
	1    5650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5250 2950 5350
Wire Wire Line
	2950 4850 2950 4950
$Comp
L power:VCC #PWR0106
U 1 1 6137D6E8
P 2950 4850
F 0 "#PWR0106" H 2950 4700 50  0001 C CNN
F 1 "VCC" H 2965 5023 50  0000 C CNN
F 2 "" H 2950 4850 50  0001 C CNN
F 3 "" H 2950 4850 50  0001 C CNN
	1    2950 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6137C177
P 2950 5350
F 0 "#PWR0105" H 2950 5100 50  0001 C CNN
F 1 "GND" H 2955 5177 50  0000 C CNN
F 2 "" H 2950 5350 50  0001 C CNN
F 3 "" H 2950 5350 50  0001 C CNN
	1    2950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 6136672F
P 2950 5100
F 0 "C1" H 3065 5146 50  0000 L CNN
F 1 "100 nF" H 3065 5055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2988 4950 50  0001 C CNN
F 3 "~" H 2950 5100 50  0001 C CNN
	1    2950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4450 3750 4550
Wire Wire Line
	3850 4450 3850 4550
Wire Wire Line
	3850 4550 3750 4550
Connection ~ 3750 4550
Wire Wire Line
	3750 4550 3750 4650
Wire Wire Line
	3950 4450 3950 4550
Wire Wire Line
	3950 4550 3850 4550
Connection ~ 3850 4550
Wire Wire Line
	5650 2950 5650 3050
Wire Wire Line
	5650 2650 5650 2600
Wire Wire Line
	5650 2600 5350 2600
$Comp
L power:VCC #PWR0113
U 1 1 6138B90B
P 2100 4250
F 0 "#PWR0113" H 2100 4100 50  0001 C CNN
F 1 "VCC" H 2100 4400 50  0000 C CNN
F 2 "" H 2100 4250 50  0001 C CNN
F 3 "" H 2100 4250 50  0001 C CNN
	1    2100 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 6138C3FC
P 2300 4100
F 0 "#PWR0114" H 2300 3850 50  0001 C CNN
F 1 "GND" H 2305 3927 50  0000 C CNN
F 2 "" H 2300 4100 50  0001 C CNN
F 3 "" H 2300 4100 50  0001 C CNN
	1    2300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4150 1950 4000
Wire Wire Line
	1950 4000 2300 4000
Wire Wire Line
	2300 4000 2300 4100
$EndSCHEMATC
