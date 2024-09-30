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

    // Set up the pointers to the registers
    uint32_t volatile *spiker_adapter_ctrl1 = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_CTRL1_REG_OFFSET);
    uint32_t volatile *spiker_adapter_status = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_STATUS_REG_OFFSET);
    
    // Set up the pointers to the DATA registers
    uint32_t volatile *spiker_adapter_reg = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_0_REG_OFFSET);
    uint32_t volatile *spiker_adapter_res = (uint32_t *)(SPIKER_ADAPTER_BASE_ADDR + SPIKER_ADAPTER_SPIKES_RESULT_0_REG_OFFSET);
    
     
    //uint32_t old_ctrl1 = *spiker_adapter_ctrl1;
    //*spiker_adapter_ctrl1 = old_ctrl1 | ((1 & SPIKER_ADAPTER_CTRL1_MASK)<<SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);

//    // READY <= 1
//    uint32_t old_ctrl1 = *spiker_adapter_ctrl1;
//    *spiker_adapter_ctrl1 = old_ctrl1 | ((1 & SPIKER_ADAPTER_CTRL1_MASK)<<SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);


    // START <= 1
    uint32_t old_ctrl1 = *spiker_adapter_ctrl1;
    *spiker_adapter_ctrl1 = old_ctrl1 | (1 << SPIKER_ADAPTER_CTRL1_START_BIT);

    printf("I've started the accelerator\n");

    // CHECK STATUS OF THE ACCELERATOR WAITING FOR READY 
    while ((*spiker_adapter_status & 0x2) != 2) //CHECK simulation TODO
    {
        printf("Waiting for the accelerator to be ready\n");
    }
    
    // Read from memory and write to the accelerator interface
    for (size_t i = 0; i < 24; i++)
    {
        printf("\t  Reg = %x \t now ", spiker_adapter_res[i]);
        printf("I'm writing buffer = %x\n", buffer[i] + i + 1);
        spiker_adapter_reg[i] = buffer[i] + i + 1;
        asm volatile ("": : : "memory");
    }

    // SAMPLE_READY <= 1 (Acceleretor can read the data)
    old_ctrl1 = *spiker_adapter_ctrl1;
    *spiker_adapter_ctrl1 = old_ctrl1 | ( 1 << SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);
    
    // CHECK STATUS OF THE ACCELERATOR
    while ((*spiker_adapter_status & 0x2) != 2)
    {
        printf("Waiting for the accelerator to be ready\n");
    }

    // READ FROM MEMORY
    for (size_t i = 0; i < 4; i++)
    {
        printf("Check: reg[%i] = %x\n", i, spiker_adapter_res[i]);
    }

    //read_from_memory(buffer);
    //start_spiker_adapter(); 
    
    printf("JOB DONE\n");
    asm volatile ("": : : "memory");

    return 0;
}