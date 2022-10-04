/**
 * @file therm_loop_sim_util.h
 * @brief  declaration of functions prototypes 
 * and constants
 * @author philippe.camus@hepl.be 
 * @date 15/8/2021   
 */

#define DEFAULT_TEMPERATURE 20
#define DEFAULT_SETPOINT 22
#define DEFAULT_LUMINOSITY 50

void hardware_setup(void);
uint16_t read_temperature(void);
void display_temperature(uint16_t);
uint16_t read_setpoint(void);
void display_set_point(uint16_t);
uint16_t read_luminosity(void);
void display_luminosity(uint16_t);
void set_heater(uint8_t);
