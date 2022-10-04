/**
 * @file therm_loop_sim_util.ino
 * @brief  simulation of thermostat
 * I/O access routines
 * @author philippe.camus@hepl.be 
 * @date 15/8/2021   
 */



void hardware_setup(void)
{
Serial.println("Hardware setup");  
}

uint16_t read_temperature(void)
{
Serial.println("Read temperature"); 
return DEFAULT_TEMPERATURE; 
}

void display_temperature(uint16_t temperature)
{
Serial.print("Temperature : ");
Serial.println(temperature);
}

uint16_t read_setpoint(void)
{
Serial.println("Read setpoint"); 
return DEFAULT_SETPOINT; 
}

void display_setpoint(uint16_t setpoint)
{
Serial.print("Setpoint : ");
Serial.println(setpoint);
}

uint16_t read_luminosity(void)
{
Serial.println("Read luminosity"); 
return DEFAULT_LUMINOSITY; 
}

void display_luminosity(uint16_t luminosity)
{
Serial.print("Luminosity : ");
Serial.println(luminosity);
}

void set_heater(uint8_t state)
{
if (state==1)
  Serial.println("Heater is ON");
 else
  Serial.println("Heater is OFF");  
}
