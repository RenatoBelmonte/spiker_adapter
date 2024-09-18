#include <stdio.h>
#include <stdint.h>
#include "pulp.h"

#define BUFFER_SIZE 98
int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");

    FILE *file = fopen("./spikes.txt", "rb");
    if (file == NULL) {
        perror("Failed to open file");
        return 1;
    }

    uint8_t buffer[98];
    size_t bytesRead = fread(buffer, sizeof(uint8_t), 98, file);
    if (bytesRead != 98) {
        perror("Failed to read enough data");
        fclose(file);
        return 1;
    }

    fclose(file);

    read_from_memory(buffer);
    start_spiker_adapter(); 

}