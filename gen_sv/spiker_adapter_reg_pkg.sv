// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package spiker_adapter_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 7;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [31:0] q;
  } spiker_adapter_reg2hw_spikes_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } sample_ready;
    struct packed {
      logic        q;
      logic        qe;
    } sample;
  } spiker_adapter_reg2hw_ctrl1_reg_t;

  typedef struct packed {
    logic [1:0]  d;
  } spiker_adapter_hw2reg_status_reg_t;

  // Register -> HW type
  typedef struct packed {
    spiker_adapter_reg2hw_spikes_mreg_t [24:0] spikes; // [803:4]
    spiker_adapter_reg2hw_ctrl1_reg_t ctrl1; // [3:0]
  } spiker_adapter_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    spiker_adapter_hw2reg_status_reg_t status; // [1:0]
  } spiker_adapter_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_0_OFFSET = 7'h 0;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_1_OFFSET = 7'h 4;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_2_OFFSET = 7'h 8;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_3_OFFSET = 7'h c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_4_OFFSET = 7'h 10;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_5_OFFSET = 7'h 14;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_6_OFFSET = 7'h 18;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_7_OFFSET = 7'h 1c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_8_OFFSET = 7'h 20;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_9_OFFSET = 7'h 24;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_10_OFFSET = 7'h 28;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_11_OFFSET = 7'h 2c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_12_OFFSET = 7'h 30;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_13_OFFSET = 7'h 34;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_14_OFFSET = 7'h 38;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_15_OFFSET = 7'h 3c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_16_OFFSET = 7'h 40;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_17_OFFSET = 7'h 44;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_18_OFFSET = 7'h 48;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_19_OFFSET = 7'h 4c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_20_OFFSET = 7'h 50;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_21_OFFSET = 7'h 54;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_22_OFFSET = 7'h 58;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_23_OFFSET = 7'h 5c;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_SPIKES_24_OFFSET = 7'h 60;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_CTRL1_OFFSET = 7'h 64;
  parameter logic [BlockAw-1:0] SPIKER_ADAPTER_STATUS_OFFSET = 7'h 68;

  // Reset values for hwext registers and their fields
  parameter logic [1:0] SPIKER_ADAPTER_CTRL1_RESVAL = 2'h 0;
  parameter logic [1:0] SPIKER_ADAPTER_STATUS_RESVAL = 2'h 0;

  // Register index
  typedef enum int {
    SPIKER_ADAPTER_SPIKES_0,
    SPIKER_ADAPTER_SPIKES_1,
    SPIKER_ADAPTER_SPIKES_2,
    SPIKER_ADAPTER_SPIKES_3,
    SPIKER_ADAPTER_SPIKES_4,
    SPIKER_ADAPTER_SPIKES_5,
    SPIKER_ADAPTER_SPIKES_6,
    SPIKER_ADAPTER_SPIKES_7,
    SPIKER_ADAPTER_SPIKES_8,
    SPIKER_ADAPTER_SPIKES_9,
    SPIKER_ADAPTER_SPIKES_10,
    SPIKER_ADAPTER_SPIKES_11,
    SPIKER_ADAPTER_SPIKES_12,
    SPIKER_ADAPTER_SPIKES_13,
    SPIKER_ADAPTER_SPIKES_14,
    SPIKER_ADAPTER_SPIKES_15,
    SPIKER_ADAPTER_SPIKES_16,
    SPIKER_ADAPTER_SPIKES_17,
    SPIKER_ADAPTER_SPIKES_18,
    SPIKER_ADAPTER_SPIKES_19,
    SPIKER_ADAPTER_SPIKES_20,
    SPIKER_ADAPTER_SPIKES_21,
    SPIKER_ADAPTER_SPIKES_22,
    SPIKER_ADAPTER_SPIKES_23,
    SPIKER_ADAPTER_SPIKES_24,
    SPIKER_ADAPTER_CTRL1,
    SPIKER_ADAPTER_STATUS
  } spiker_adapter_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] SPIKER_ADAPTER_PERMIT [27] = '{
    4'b 1111, // index[ 0] SPIKER_ADAPTER_SPIKES_0
    4'b 1111, // index[ 1] SPIKER_ADAPTER_SPIKES_1
    4'b 1111, // index[ 2] SPIKER_ADAPTER_SPIKES_2
    4'b 1111, // index[ 3] SPIKER_ADAPTER_SPIKES_3
    4'b 1111, // index[ 4] SPIKER_ADAPTER_SPIKES_4
    4'b 1111, // index[ 5] SPIKER_ADAPTER_SPIKES_5
    4'b 1111, // index[ 6] SPIKER_ADAPTER_SPIKES_6
    4'b 1111, // index[ 7] SPIKER_ADAPTER_SPIKES_7
    4'b 1111, // index[ 8] SPIKER_ADAPTER_SPIKES_8
    4'b 1111, // index[ 9] SPIKER_ADAPTER_SPIKES_9
    4'b 1111, // index[10] SPIKER_ADAPTER_SPIKES_10
    4'b 1111, // index[11] SPIKER_ADAPTER_SPIKES_11
    4'b 1111, // index[12] SPIKER_ADAPTER_SPIKES_12
    4'b 1111, // index[13] SPIKER_ADAPTER_SPIKES_13
    4'b 1111, // index[14] SPIKER_ADAPTER_SPIKES_14
    4'b 1111, // index[15] SPIKER_ADAPTER_SPIKES_15
    4'b 1111, // index[16] SPIKER_ADAPTER_SPIKES_16
    4'b 1111, // index[17] SPIKER_ADAPTER_SPIKES_17
    4'b 1111, // index[18] SPIKER_ADAPTER_SPIKES_18
    4'b 1111, // index[19] SPIKER_ADAPTER_SPIKES_19
    4'b 1111, // index[20] SPIKER_ADAPTER_SPIKES_20
    4'b 1111, // index[21] SPIKER_ADAPTER_SPIKES_21
    4'b 1111, // index[22] SPIKER_ADAPTER_SPIKES_22
    4'b 1111, // index[23] SPIKER_ADAPTER_SPIKES_23
    4'b 1111, // index[24] SPIKER_ADAPTER_SPIKES_24
    4'b 0001, // index[25] SPIKER_ADAPTER_CTRL1
    4'b 0001  // index[26] SPIKER_ADAPTER_STATUS
  };

endpackage

