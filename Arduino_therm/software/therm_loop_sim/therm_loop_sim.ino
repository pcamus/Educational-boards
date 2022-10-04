/**
 * @file therm_loop_sim.ino
 * @brief  simulation of thermostat
 * Uses therm_loop_sim_util.ino for functions code
 * @author philippe.camus@hepl.be 
 * @date 15/8/2021   
 */

#include "therm_loop_sim_util.h"

// the setup function runs once when you press reset or power the board
void setup() 
{
// initialize console serial communication at 9600 bits per second:
Serial.begin(9600);

//hardware initialization sensors, display, output controler...
hardware_setup();
Serial.println("");
}

// run continuously
void loop()
{  
uint16_t temperature;
uint16_t setpoint;
uint16_t luminosity;
  
temperature = read_temperature(); 
display_temperature(temperature);

setpoint = read_setpoint(); 
display_setpoint(setpoint);

if (temperature < setpoint)
  set_heater(1);
 else
  set_heater(0);
   
luminosity = read_luminosity(); 
display_luminosity(luminosity); 

delay(2500);
Serial.println("");
}
