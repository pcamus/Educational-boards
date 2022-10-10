/**
 * @file therm_loop_util_v1.ino
 * @brief  simulation of thermostat
 * I/O access routines
 * @author philippe.camus@hepl.be 
 * @date 15/8/2021   
 */

void hardware_setup(void)
{
#ifdef DEBUG 
Serial.println("Hardware setup");
Serial.println();
#endif
lcd.init(); // initialize the lcd 
lcd.backlight();
lcd.setCursor(1,0); 
lcd.print("Hardware setup"); 

sensors.begin();
pinMode(HEATER_LED, OUTPUT);
pinMode(BACKLIGHT, OUTPUT);
}

uint16_t read_temperature(void)
{
#ifdef DEBUG  
Serial.println("Read temperature"); 
#endif
sensors.requestTemperatures();
return sensors.getTempCByIndex(0); 
}

void display_temperature(uint16_t temperature)
{
#ifdef DEBUG
Serial.print("Temperature : ");
Serial.println(temperature);
#endif
lcd.setCursor(0,0);
lcd.print("Temperature: ");
lcd.print(temperature);
}

uint16_t read_setpoint(void)
{
#ifdef DEBUG  
Serial.println("Read setpoint"); 
#endif
return (analogRead(POT)/32)+4; // between 4 and 36
}

void display_setpoint(uint16_t setpoint)
{
#ifdef DEBUG
Serial.print("Setpoint : ");
Serial.println(setpoint);
#endif
lcd.setCursor(0,1);
lcd.print("Setpoint: ");
lcd.print(setpoint);
}

uint16_t read_luminosity(void)
{
#ifdef DEBUG
Serial.println("Read luminosity");
#endif 
return analogRead(LDR); 
}

void display_luminosity(uint16_t luminosity)
{
#ifdef DEBUG
Serial.print("Luminosity : ");
Serial.println(luminosity);
#endif
analogWrite(BACKLIGHT,analogRead(LDR)/4);
}

void set_heater(uint8_t state)
{
if (state==1)
  {
  #ifdef DEBUG  
  Serial.println("Heater is ON");
    #endif
  digitalWrite(HEATER_LED, HIGH);
  }
 else
  {
  #ifdef DEBUG  
  Serial.println("Heater is OFF");  
  #endif
  digitalWrite(HEATER_LED, LOW);
  }
}
