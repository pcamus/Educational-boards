/**
 * @file therm_loop_v1.ino
 * @brief  thermostat
 * Uses therm_loop_util_v1.ino for functions code
 * @author philippe.camus@hepl.be 
 * @date 19/8/2021   
 */
 
// Necessary libraries 
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <OneWire.h>
#include <DallasTemperature.h>

#define HEATER_LED 9
#define DS18B20_PIN 10
#define POT A0
#define LDR A1
#define BACKLIGHT 2
#define ON 1
#define OFF 0

#define PROBE 13 // to check loop timing

//#define DEBUG // in normal mode comment out this line
 
// create I/O objects
LiquidCrystal_I2C lcd(0x27,20,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display
OneWire oneWire(DS18B20_PIN); // set up oneWire to pin 10 (DS18B20 connection)
DallasTemperature sensors(&oneWire); // create a DS18B20 object

#include "therm_loop_util_v1.h" // header for your functions


// the setup function runs once when you press reset or power the board
void setup() 
{
#ifdef DEBUG
// initialize console serial communication at 9600 bits per second:
Serial.begin(9600);
#endif

//hardware initialization sensors, display, output controler...
hardware_setup();

pinMode(PROBE, OUTPUT);
digitalWrite(PROBE, LOW);
}


// run continuously
void loop()
{  
uint16_t temperature;
uint16_t setpoint;
uint16_t luminosity;

digitalWrite(PROBE, HIGH);// 1 level = loop duration
  
temperature = read_temperature(); 
display_temperature(temperature);

setpoint = read_setpoint(); 
display_setpoint(setpoint);

if (temperature < setpoint)
  set_heater(ON);
 else
  set_heater(OFF);
   
luminosity = read_luminosity(); 
display_luminosity(luminosity); 

digitalWrite(PROBE, LOW);

delay(500);
#ifdef DEBUG
Serial.println("");
#endif
}
