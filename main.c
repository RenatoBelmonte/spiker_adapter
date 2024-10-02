#include <stdint.h>
#include <stdio.h>
#include "pulp.h"
#include "spiker_adapter.h"

#define SPIKER_ADAPTER_BASE_ADDR  0x1A400000
#define SPIKER_ADAPTER_CTRL1_MASK 0x1

int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");

    uint32_t buffer[SPIKER_ADAPTER_SPIKES_MULTIREG_COUNT];
    memset(buffer,  0xFEDCBA98, sizeof (buffer));

//    for (size_t i = 0; i < SPIKER_ADAPTER_SPIKES_MULTIREG_COUNT; i++)
//    {   
//        buffer[i] = 0xFEFEFEFE;
//    }
    
    printf("The address of buffer is %x\n", &buffer);

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
//    printf("sample_ready = %x", *spiker_adapter_ctrl1);
/*
    // Read from memory (buffer) ...
    for (size_t i = 0; i < SPIKER_ADAPTER_SPIKES_RESULT_MULTIREG_COUNT; i++)
    {
        printf("\t  Reg = %x \t now ", spiker_adapter_res[i]);
    }
    printf("\n");
*/

    // ... and write to the accelerator interface (spiker_reg) \todo
    for (size_t i = 0; i < SPIKER_ADAPTER_SPIKES_MULTIREG_COUNT - 23; i++)
    {
        //printf("\t I'm writing buffer = %x\n", buffer[i]);
        spiker_adapter_reg[i] = buffer[i] + i + 1;
        asm volatile ("": : : "memory");
    }

    // SAMPLE_READY <= 1 (Accelerator can read the data)
    uint32_t old_ctrl1 = *spiker_adapter_ctrl1;
    *spiker_adapter_ctrl1 = old_ctrl1 | ( 1 << SPIKER_ADAPTER_CTRL1_SAMPLE_READY_BIT);
    printf("Samples are ready (sample_ready) ctrl1 = %x\n", *spiker_adapter_ctrl1);
    
    // START <= 1
    old_ctrl1 = *spiker_adapter_ctrl1;
    *spiker_adapter_ctrl1 = old_ctrl1 | (1 << SPIKER_ADAPTER_CTRL1_START_BIT);
    printf("I've started the accelerator (start) ctrl1 = %x\n", *spiker_adapter_ctrl1);


    // CHECK STATUS OF THE ACCELERATOR WAITING FOR READY 
    while ((*spiker_adapter_status & 0x1) != 1) //CHECK simulation TODO
    {
        printf("Waiting for the accelerator to be ready\t ctrl = %x\n", *spiker_adapter_status);
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