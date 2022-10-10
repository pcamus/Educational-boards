/**
 * @file therm_loop_util_v1.h
 * @brief  declaration of functions prototypes 
 * and constants
 * @author philippe.camus@hepl.be 
 * @date 15/8/2021   
 */

void hardware_setup(void);
uint16_t read_temperature(void);
void display_temperature(uint16_t);
uint16_t read_setpoint(void);
void display_set_point(uint16_t);
uint16_t read_luminosity(void);
void display_luminosity(uint16_t);
void set_heater(uint8_t);
