#include <stdint.h>
#include <stdio.h>
#include "pulp.h"
#include "spiker_adapter.h"

#define BUFFER_SIZE 98
#define SPIKER_ADAPTER_BASE_ADDR  0x1A400000

int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");

    uint32_t buffer[BUFFER_SIZE];
    memset(buffer, 0, sizeof (buffer));
    printf("The address of buffer is %i", &buffer);
     
    printf("I'm in the function\n");
    uint32_t volatile *spiker_adapter_reg = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_0_REG_OFFSET);
    uint32_t volatile *spiker_adapter_res = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_RESULT_0_REG_OFFSET);
    // Read from memory
    for (size_t i = 0; i < 24; i++)
    {
        printf("\t  Reg = %x \t now ", spiker_adapter_res[i]);
        printf("I'm writing buffer = %x\t", buffer[i] + i + 1);
        spiker_adapter_reg[i] = buffer[i] + i + 1;
        asm volatile ("": : : "memory");
        printf("Check: reg = %x\n", spiker_adapter_res[i]);
    }
    //read_from_memory(buffer);
    //start_spiker_adapter(); 
    
    printf("JOB DONE\n");
    asm volatile ("": : : "memory");

}