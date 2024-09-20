#include <stdint.h>
#include <stdio.h>
#include "pulp.h"

#define BUFFER_SIZE 98

int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");

    uint8_t buffer[BUFFER_SIZE];
    memset(buffer, 10, sizeof (buffer));
     
    printf("I'm in the function\n");
    uint8_t volatile *spiker_adapter_reg = (uint8_t *)0x1A400000;
    // Read from memory
    for (size_t i = 0; i < 25; i++)
    {
        uint8_t val = buffer[i] + i;
        printf("I'm writing buffer = %hhi \t", buffer[i] + i);
        spiker_adapter_reg[i] = val;
        printf("Check: val = %hhi; reg = %hhi\n", val, spiker_adapter_reg[i]);
    }
    //read_from_memory(buffer);
    //start_spiker_adapter(); 
    
    printf("JOB DONE\n");

}