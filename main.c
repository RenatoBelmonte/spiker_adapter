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
     
    read_from_memory(buffer);
    start_spiker_adapter(); 
    
    printf("JOB DONE\n");

}