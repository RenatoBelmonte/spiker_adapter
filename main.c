/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include "pulp.h"
#include <stdint.h>
//#include <rt/rt_api.h>
//#include <rt/rt_gpio.h>

#define GPIO 8

int __rt_fpga_fc_frequency = 20000000;
int __rt_fpga_periph_frequency = 10000000;

int main()
{
    printf("Hello World!\n");


    uint32_t a[32];
    uint32_t b[32];
    uint32_t result[64];

    memset(a, 0, sizeof (a));
    memset(b, 0, sizeof (b));
    memset(result, 0, sizeof (result));

    a[0] = 3;
    b[0] = 5;
    set_delay(50);

    wide_multiply(a, b, result);
    
    printf("Result [0]: %d\n", result[0]);
    
//    // GPIO initialization
//    rt_gpio_init(0, GPIO);
//
//    // Configure GPIO as an outpout
//    rt_gpio_set_dir(0, 1<<GPIO, RT_GPIO_IS_OUT);
//
//    // Now set several values
//    rt_gpio_set_pin_value(0, GPIO, 1);
//
//    rt_time_wait_us(2000);
//
//    rt_gpio_set_pin_value(0, GPIO, 0);
//
//    rt_time_wait_us(2000);
//
//    rt_gpio_set_pin_value(0, GPIO, 1);
//

    return 0;
}
