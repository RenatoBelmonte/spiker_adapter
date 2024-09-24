#include <stdint.h>
#include <stdio.h>
#include "pulp.h"
#include "spiker_adapter.h"

#define BUFFER_SIZE 98
#define SPIKER_ADAPTER_BASE_ADDR  0x1A400000
#define SPIKER_ADAPTER_CTRL1_MASK 0x1

int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");

    uint32_t buffer[BUFFER_SIZE];
    memset(buffer, 0, sizeof (buffer));
    printf("The address of buffer is %i\n", &buffer);

    uint32_t volatile *spiker_adapter_ctrl1 = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_CTRL1_REG_OFFSET);
    uint32_t volatile *spiker_adapter_status = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_STATUS_REG_OFFSET);
    uint32_t old_ctrl1 = *spiker_adapter_ctrl1;

    *spiker_adapter_ctrl1 = old_ctrl1 | ((1 & SPIKER_ADAPTER_CTRL1_MASK)<<SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);


    printf("I'm in the function\n");
    uint32_t volatile *spiker_adapter_reg = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_0_REG_OFFSET);
    uint32_t volatile *spiker_adapter_res = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_RESULT_0_REG_OFFSET);

    while (!spiker_adapter_status)
    {
        printf("Waiting for the accelerator to be ready\n");
    }
    
    // Read from memory
    for (size_t i = 0; i < 24; i++)
    {
        printf("\t  Reg = %x \t now ", spiker_adapter_res[i]);
        printf("I'm writing buffer = %x\t", buffer[i] + i + 1);
        spiker_adapter_reg[i] = buffer[i] + i + 1;
        asm volatile ("": : : "memory");
    }
    *spiker_adapter_ctrl1 = old_ctrl1 | ((1 & SPIKER_ADAPTER_CTRL1_MASK)<<SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);
    *spiker_adapter_ctrl1 = old_ctrl1 & (0xFFFFFFFE);
    asm volatile ("": : : "memory");
    while (!spiker_adapter_status)
    {
        printf("Waiting for the accelerator to be ready\n");
    } 
    for (size_t i = 0; i < 24; i++)
    {
        printf("Check: reg = %x\n", spiker_adapter_res[i]);
    }
    //read_from_memory(buffer);
    //start_spiker_adapter(); 
    
    printf("JOB DONE\n");
    asm volatile ("": : : "memory");

    return 0;
}