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
    memset(buffer, 0, sizeof (buffer));
     
    printf("I'm in the function\n");
    uint8_t volatile *spiker_adapter_reg = (uint8_t *)0x1A402000;
    // Read from memory
    for (size_t i = 0; i < 25; i++)
    {
        printf("I'mwriting\n");
        spiker_adapter_reg[i] = buffer[i] + i;
    }
    //read_from_memory(buffer);
    //start_spiker_adapter(); 
    
    printf("JOB DONE\n");

}