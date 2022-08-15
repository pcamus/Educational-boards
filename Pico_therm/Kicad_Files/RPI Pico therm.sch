EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RPi Pico Thermostat"
Date ""
Rev ""
Comp "HEPL"
Comment1 "philippe.camus@hepl.be"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RPi_Pico:Pico U1
U 1 1 613B3F85
P 4000 3050
F 0 "U1" H 4000 4265 50  0000 C CNN
F 1 "Pico" H 4000 4174 50  0000 C CNN
F 2 "RPi_Pico:RPi_Pico_SMD_TH" V 4000 3050 50  0001 C CNN
F 3 "" H 4000 3050 50  0001 C CNN
	1    4000 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 613DB407
P 2600 5000
F 0 "C1" H 2715 5046 50  0000 L CNN
F 1 "100nF" H 2715 4955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2638 4850 50  0001 C CNN
F 3 "~" H 2600 5000 50  0001 C CNN
	1    2600 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 613DBCBC
P 6000 2800
F 0 "D1" V 6039 2682 50  0000 R CNN
F 1 "LED" V 5948 2682 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 6000 2800 50  0001 C CNN
F 3 "~" H 6000 2800 50  0001 C CNN
	1    6000 2800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 613DC7D6
P 6000 4050
F 0 "R2" H 6070 4096 50  0000 L CNN
F 1 "10k" H 6070 4005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 4050 50  0001 C CNN
F 3 "~" H 6000 4050 50  0001 C CNN
	1    6000 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 613DD114
P 6000 2400
F 0 "R1" H 6070 2446 50  0000 L CNN
F 1 "560R" H 6070 2355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 2400 50  0001 C CNN
F 3 "~" H 6000 2400 50  0001 C CNN
	1    6000 2400
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Optical:LDR07 LDR1
U 1 1 613DDC3B
P 6000 3650
F 0 "LDR1" H 6070 3696 50  0000 L CNN
F 1 "LDR07" H 6070 3605 50  0000 L CNN
F 2 "OptoDevice:R_LDR_5.1x4.3mm_P3.4mm_Vertical" V 6175 3650 50  0001 C CNN
F 3 "http://www.tme.eu/de/Document/f2e3ad76a925811312d226c31da4cd7e/LDR07.pdf" H 6000 3600 50  0001 C CNN
	1    6000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2250 6000 2150
Wire Wire Line
	6000 2150 5650 2150
Wire Wire Line
	6000 2550 6000 2650
Wire Wire Line
	6000 3800 6000 3850
Connection ~ 6000 3850
Wire Wire Line
	6000 3850 6000 3900
$Comp
L power:GND #PWR0101
U 1 1 613DF73D
P 6000 2950
F 0 "#PWR0101" H 6000 2700 50  0001 C CNN
F 1 "GND" H 6005 2777 50  0000 C CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "" H 6000 2950 50  0001 C CNN
	1    6000 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 613DFE90
P 6000 4200
F 0 "#PWR0102" H 6000 3950 50  0001 C CNN
F 1 "GND" H 6005 4027 50  0000 C CNN
F 2 "" H 6000 4200 50  0001 C CNN
F 3 "" H 6000 4200 50  0001 C CNN
	1    6000 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 613E1FDF
P 6000 3500
F 0 "#PWR0103" H 6000 3350 50  0001 C CNN
F 1 "+3.3V" H 6015 3673 50  0000 C CNN
F 2 "" H 6000 3500 50  0001 C CNN
F 3 "" H 6000 3500 50  0001 C CNN
	1    6000 3500
	1    0    0    -1  
$EndComp
Text Label 5650 2150 0    50   ~ 0
Heater
Text Label 5650 3850 0    50   ~ 0
LDR
$Comp
L power:GND #PWR0104
U 1 1 613E28CF
P 2600 5300
F 0 "#PWR0104" H 2600 5050 50  0001 C CNN
F 1 "GND" H 2605 5127 50  0000 C CNN
F 2 "" H 2600 5300 50  0001 C CNN
F 3 "" H 2600 5300 50  0001 C CNN
	1    2600 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 613E2D8E
P 2600 4700
F 0 "#PWR0105" H 2600 4550 50  0001 C CNN
F 1 "+5V" H 2615 4873 50  0000 C CNN
F 2 "" H 2600 4700 50  0001 C CNN
F 3 "" H 2600 4700 50  0001 C CNN
	1    2600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4700 2600 4850
Wire Wire Line
	2600 5150 2600 5300
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 613EF710
P 4450 4900
F 0 "J4" H 4422 4832 50  0000 R CNN
F 1 "LCD Backlight" H 4422 4923 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 4450 4900 50  0001 C CNN
F 3 "~" H 4450 4900 50  0001 C CNN
	1    4450 4900
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 613F0D34
P 1500 2250
F 0 "J1" H 1608 2531 50  0000 C CNN
F 1 "SetPoint" H 1608 2440 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1500 2250 50  0001 C CNN
F 3 "~" H 1500 2250 50  0001 C CNN
	1    1500 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 613F1E11
P 1500 3050
F 0 "J2" H 1608 3331 50  0000 C CNN
F 1 "Temperature" H 1608 3240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1500 3050 50  0001 C CNN
F 3 "~" H 1500 3050 50  0001 C CNN
	1    1500 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 613F288C
P 1500 3850
F 0 "J3" H 1608 4131 50  0000 C CNN
F 1 "LCD" H 1608 4040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1500 3850 50  0001 C CNN
F 3 "~" H 1500 3850 50  0001 C CNN
	1    1500 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 613F3092
P 2300 1400
F 0 "J5" H 2408 1681 50  0000 C CNN
F 1 "Neopixel" H 2408 1590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2300 1400 50  0001 C CNN
F 3 "~" H 2300 1400 50  0001 C CNN
	1    2300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 613F6B8A
P 3200 5000
F 0 "C2" H 3315 5046 50  0000 L CNN
F 1 "100nF" H 3315 4955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3238 4850 50  0001 C CNN
F 3 "~" H 3200 5000 50  0001 C CNN
	1    3200 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 613F6B90
P 3200 5300
F 0 "#PWR0106" H 3200 5050 50  0001 C CNN
F 1 "GND" H 3205 5127 50  0000 C CNN
F 2 "" H 3200 5300 50  0001 C CNN
F 3 "" H 3200 5300 50  0001 C CNN
	1    3200 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 613F6B96
P 3200 4700
F 0 "#PWR0107" H 3200 4550 50  0001 C CNN
F 1 "+3.3V" H 3215 4873 50  0000 C CNN
F 2 "" H 3200 4700 50  0001 C CNN
F 3 "" H 3200 4700 50  0001 C CNN
	1    3200 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4700 3200 4850
Wire Wire Line
	3200 5150 3200 5300
Wire Wire Line
	1700 2150 2000 2150
Wire Wire Line
	1700 2350 2000 2350
Wire Wire Line
	1700 2250 2150 2250
$Comp
L power:GND #PWR0108
U 1 1 613F7BE7
P 2150 2250
F 0 "#PWR0108" H 2150 2000 50  0001 C CNN
F 1 "GND" H 2155 2077 50  0000 C CNN
F 2 "" H 2150 2250 50  0001 C CNN
F 3 "" H 2150 2250 50  0001 C CNN
	1    2150 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 613F854C
P 2000 2150
F 0 "#PWR0109" H 2000 2000 50  0001 C CNN
F 1 "+3.3V" H 2015 2323 50  0000 C CNN
F 2 "" H 2000 2150 50  0001 C CNN
F 3 "" H 2000 2150 50  0001 C CNN
	1    2000 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2950 2000 2950
Wire Wire Line
	1700 3050 2150 3050
Wire Wire Line
	1700 3150 2000 3150
$Comp
L power:+3.3V #PWR0110
U 1 1 613F9BBE
P 2150 3050
F 0 "#PWR0110" H 2150 2900 50  0001 C CNN
F 1 "+3.3V" H 2165 3223 50  0000 C CNN
F 2 "" H 2150 3050 50  0001 C CNN
F 3 "" H 2150 3050 50  0001 C CNN
	1    2150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 613FA3AA
P 2000 3150
F 0 "#PWR0111" H 2000 2900 50  0001 C CNN
F 1 "GND" H 2005 2977 50  0000 C CNN
F 2 "" H 2000 3150 50  0001 C CNN
F 3 "" H 2000 3150 50  0001 C CNN
	1    2000 3150
	1    0    0    -1  
$EndComp
Text Label 1700 2950 0    50   ~ 0
Onewire
Wire Wire Line
	2500 1300 2750 1300
Wire Wire Line
	2500 1500 2750 1500
Wire Wire Line
	2500 1400 2750 1400
$Comp
L power:+3.3V #PWR0112
U 1 1 613DFEB4
P 2750 1300
F 0 "#PWR0112" H 2750 1150 50  0001 C CNN
F 1 "+3.3V" H 2765 1473 50  0000 C CNN
F 2 "" H 2750 1300 50  0001 C CNN
F 3 "" H 2750 1300 50  0001 C CNN
	1    2750 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 613E0808
P 2750 1500
F 0 "#PWR0113" H 2750 1250 50  0001 C CNN
F 1 "GND" H 2755 1327 50  0000 C CNN
F 2 "" H 2750 1500 50  0001 C CNN
F 3 "" H 2750 1500 50  0001 C CNN
	1    2750 1500
	1    0    0    -1  
$EndComp
Text Label 2500 1400 0    50   ~ 0
Neopix
Text Label 1800 2350 0    50   ~ 0
POT
Wire Wire Line
	1700 3750 1900 3750
Wire Wire Line
	1900 3750 1900 3600
Wire Wire Line
	1900 3600 2300 3600
Wire Wire Line
	2300 3600 2300 3750
Wire Wire Line
	1700 3850 2050 3850
Wire Wire Line
	1700 3950 2050 3950
Wire Wire Line
	1700 4050 2050 4050
$Comp
L power:+5V #PWR0114
U 1 1 613E3118
P 2050 3850
F 0 "#PWR0114" H 2050 3700 50  0001 C CNN
F 1 "+5V" H 2065 4023 50  0000 C CNN
F 2 "" H 2050 3850 50  0001 C CNN
F 3 "" H 2050 3850 50  0001 C CNN
	1    2050 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 613E374D
P 2300 3750
F 0 "#PWR0115" H 2300 3500 50  0001 C CNN
F 1 "GND" H 2305 3577 50  0000 C CNN
F 2 "" H 2300 3750 50  0001 C CNN
F 3 "" H 2300 3750 50  0001 C CNN
	1    2300 3750
	1    0    0    -1  
$EndComp
Text Label 1900 3950 0    50   ~ 0
SDA
Text Label 1900 4050 0    50   ~ 0
SCL
Wire Wire Line
	3300 3100 3000 3100
Wire Wire Line
	4700 3000 5000 3000
Wire Wire Line
	4700 2900 5000 2900
Wire Wire Line
	3300 4000 3000 4000
Wire Wire Line
	4700 3200 5000 3200
Wire Wire Line
	3300 2400 3000 2400
Text Label 3000 2400 0    50   ~ 0
SCK
Text Label 3000 3200 0    50   ~ 0
SCL
Text Label 3000 3100 0    50   ~ 0
SDA
Text Label 4850 3000 0    50   ~ 0
POT
Text Label 4850 2900 0    50   ~ 0
LDR
Wire Wire Line
	4250 4900 3950 4900
Wire Wire Line
	3300 3900 3000 3900
Text Label 3950 4900 0    50   ~ 0
Bckl
Text Label 3000 4000 0    50   ~ 0
Bckl
Text Label 3000 3900 0    50   ~ 0
Heater
Text Label 4750 3200 0    50   ~ 0
Onewire
NoConn ~ 3300 2100
NoConn ~ 3300 2900
NoConn ~ 3300 3400
NoConn ~ 3300 3500
NoConn ~ 4700 4000
NoConn ~ 4700 3900
NoConn ~ 4700 3700
NoConn ~ 4700 3600
NoConn ~ 4700 3500
NoConn ~ 4700 3400
NoConn ~ 4700 3100
NoConn ~ 4700 2700
NoConn ~ 4700 2600
NoConn ~ 4700 2200
NoConn ~ 4700 2400
Wire Wire Line
	4700 2100 4800 2100
Wire Wire Line
	4800 2100 4800 1950
Wire Wire Line
	4700 2500 4950 2500
$Comp
L power:+3.3V #PWR0116
U 1 1 613F67C9
P 4950 2500
F 0 "#PWR0116" H 4950 2350 50  0001 C CNN
F 1 "+3.3V" H 4850 2650 50  0000 C CNN
F 2 "" H 4950 2500 50  0001 C CNN
F 3 "" H 4950 2500 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 613F7044
P 4800 1950
F 0 "#PWR0117" H 4800 1800 50  0001 C CNN
F 1 "+5V" H 4815 2123 50  0000 C CNN
F 2 "" H 4800 1950 50  0001 C CNN
F 3 "" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2300 5200 2300
Wire Wire Line
	4700 3800 5200 3800
Wire Wire Line
	3300 3800 2800 3800
Wire Wire Line
	3300 2800 2800 2800
Wire Wire Line
	3300 2300 2800 2300
Wire Wire Line
	4700 2800 5200 2800
Wire Wire Line
	3300 3300 2800 3300
Wire Wire Line
	2800 2300 2800 2800
Connection ~ 2800 2800
Wire Wire Line
	2800 2800 2800 3300
Connection ~ 2800 3300
Wire Wire Line
	2800 3300 2800 3800
Connection ~ 2800 3800
Wire Wire Line
	2800 3800 2800 4250
Wire Wire Line
	5200 2300 5200 2800
Connection ~ 5200 2800
Wire Wire Line
	5200 2800 5200 3300
Connection ~ 5200 3800
Wire Wire Line
	5200 3800 5200 4250
$Comp
L power:GND #PWR0118
U 1 1 6140093B
P 5200 4250
F 0 "#PWR0118" H 5200 4000 50  0001 C CNN
F 1 "GND" H 5205 4077 50  0000 C CNN
F 2 "" H 5200 4250 50  0001 C CNN
F 3 "" H 5200 4250 50  0001 C CNN
	1    5200 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 61400D3B
P 2800 4250
F 0 "#PWR0119" H 2800 4000 50  0001 C CNN
F 1 "GND" H 2805 4077 50  0000 C CNN
F 2 "" H 2800 4250 50  0001 C CNN
F 3 "" H 2800 4250 50  0001 C CNN
	1    2800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3850 6000 3850
Wire Wire Line
	4700 3300 5200 3300
Connection ~ 5200 3300
Wire Wire Line
	5200 3300 5200 3800
NoConn ~ 4100 4200
NoConn ~ 3900 4200
NoConn ~ 4000 4200
NoConn ~ 3300 3000
Wire Wire Line
	3300 3200 3000 3200
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 61431E8B
P 3550 1350
F 0 "J6" H 3658 1731 50  0000 C CNN
F 1 "µSD" H 3658 1640 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 3550 1350 50  0001 C CNN
F 3 "~" H 3550 1350 50  0001 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1150 4150 1150
Wire Wire Line
	3750 1250 4150 1250
Wire Wire Line
	3750 1350 4150 1350
Wire Wire Line
	3750 1450 4150 1450
Wire Wire Line
	3750 1550 4150 1550
Wire Wire Line
	3750 1650 4150 1650
$Comp
L power:+3.3V #PWR0120
U 1 1 61439439
P 4150 1150
F 0 "#PWR0120" H 4150 1000 50  0001 C CNN
F 1 "+3.3V" H 4165 1323 50  0000 C CNN
F 2 "" H 4150 1150 50  0001 C CNN
F 3 "" H 4150 1150 50  0001 C CNN
	1    4150 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 61439ADD
P 4150 1650
F 0 "#PWR0121" H 4150 1400 50  0001 C CNN
F 1 "GND" H 4155 1477 50  0000 C CNN
F 2 "" H 4150 1650 50  0001 C CNN
F 3 "" H 4150 1650 50  0001 C CNN
	1    4150 1650
	1    0    0    -1  
$EndComp
Text Label 4000 1250 0    50   ~ 0
SCK
Text Label 4000 1350 0    50   ~ 0
MOSI
Text Label 4000 1450 0    50   ~ 0
MISO
Text Label 4000 1550 0    50   ~ 0
CSn
$Comp
L Connector:Conn_01x04_Male J7
U 1 1 6143CD5C
P 5150 1250
F 0 "J7" H 5258 1531 50  0000 C CNN
F 1 "UART0" H 5258 1440 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5150 1250 50  0001 C CNN
F 3 "~" H 5150 1250 50  0001 C CNN
	1    5150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1250 5700 1250
Wire Wire Line
	5350 1350 5700 1350
Wire Wire Line
	5350 1450 5700 1450
Wire Wire Line
	5350 1150 5700 1150
$Comp
L power:+3.3V #PWR0122
U 1 1 6143F143
P 5700 1150
F 0 "#PWR0122" H 5700 1000 50  0001 C CNN
F 1 "+3.3V" H 5715 1323 50  0000 C CNN
F 2 "" H 5700 1150 50  0001 C CNN
F 3 "" H 5700 1150 50  0001 C CNN
	1    5700 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 6143F655
P 5700 1450
F 0 "#PWR0123" H 5700 1200 50  0001 C CNN
F 1 "GND" H 5705 1277 50  0000 C CNN
F 2 "" H 5700 1450 50  0001 C CNN
F 3 "" H 5700 1450 50  0001 C CNN
	1    5700 1450
	1    0    0    -1  
$EndComp
Text Label 5550 1250 0    50   ~ 0
TxD0
Text Label 5550 1350 0    50   ~ 0
RxD0
Wire Wire Line
	3300 2200 3000 2200
Wire Wire Line
	3300 2500 3000 2500
Wire Wire Line
	3300 2600 3000 2600
Wire Wire Line
	3300 2700 3000 2700
Text Label 3000 2500 0    50   ~ 0
MOSI
Text Label 3000 2600 0    50   ~ 0
MISO
Text Label 3000 2700 0    50   ~ 0
CSn
Text Label 3000 2200 0    50   ~ 0
Neopix
Wire Wire Line
	3300 3600 3000 3600
Wire Wire Line
	3300 3700 3000 3700
Text Label 3000 3600 0    50   ~ 0
TxD0
Text Label 3000 3700 0    50   ~ 0
RxD0
$EndSCHEMATC
