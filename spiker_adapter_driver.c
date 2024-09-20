#include "spiker_adapter.h"
#include <stdint.h>
#include <stddef.h>

#define SPIKER_ADAPTER_SPIKES_BASE_ADDR 0x1A402000

void read_from_memory(uint8_t *buffer)
{
    //printf("I'm in the function\n");
    uint8_t volatile *spiker_adapter_reg = (uint8_t *)SPIKER_ADAPTER_SPIKES_BASE_ADDR;
    // Read from memory
    for (size_t i = 0; i < SPIKER_ADAPTER_SPIKES_MULTIREG_COUNT; i++)
    {
        spiker_adapter_reg[i] = buffer[i];
    }
}

void start_spiker_adapter()
{
    // Start the spiker adapter
     
}