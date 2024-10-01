// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`


`include "common_cells/assertions.svh"

module spiker_adapter_reg_top #(
  parameter type reg_req_t = logic,
  parameter type reg_rsp_t = logic,
  parameter int AW = 7
) (
  input logic clk_i,
  input logic rst_ni,
  input  reg_req_t reg_req_i,
  output reg_rsp_t reg_rsp_o,
  // To HW
  output spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t reg2hw, // Write
  input  spiker_adapter_reg_pkg::spiker_adapter_hw2reg_t hw2reg, // Read


  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import spiker_adapter_reg_pkg::* ;

  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [BlockAw-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  // Below register interface can be changed
  reg_req_t  reg_intf_req;
  reg_rsp_t  reg_intf_rsp;


  assign reg_intf_req = reg_req_i;
  assign reg_rsp_o = reg_intf_rsp;


  assign reg_we = reg_intf_req.valid & reg_intf_req.write;
  assign reg_re = reg_intf_req.valid & ~reg_intf_req.write;
  assign reg_addr = reg_intf_req.addr[BlockAw-1:0];
  assign reg_wdata = reg_intf_req.wdata;
  assign reg_be = reg_intf_req.wstrb;
  assign reg_intf_rsp.rdata = reg_rdata;
  assign reg_intf_rsp.error = reg_error;
  assign reg_intf_rsp.ready = 1'b1;

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err;


  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [31:0] spikes_0_qs;
  logic [31:0] spikes_0_wd;
  logic spikes_0_we;
  logic [31:0] spikes_1_qs;
  logic [31:0] spikes_1_wd;
  logic spikes_1_we;
  logic [31:0] spikes_2_qs;
  logic [31:0] spikes_2_wd;
  logic spikes_2_we;
  logic [31:0] spikes_3_qs;
  logic [31:0] spikes_3_wd;
  logic spikes_3_we;
  logic [31:0] spikes_4_qs;
  logic [31:0] spikes_4_wd;
  logic spikes_4_we;
  logic [31:0] spikes_5_qs;
  logic [31:0] spikes_5_wd;
  logic spikes_5_we;
  logic [31:0] spikes_6_qs;
  logic [31:0] spikes_6_wd;
  logic spikes_6_we;
  logic [31:0] spikes_7_qs;
  logic [31:0] spikes_7_wd;
  logic spikes_7_we;
  logic [31:0] spikes_8_qs;
  logic [31:0] spikes_8_wd;
  logic spikes_8_we;
  logic [31:0] spikes_9_qs;
  logic [31:0] spikes_9_wd;
  logic spikes_9_we;
  logic [31:0] spikes_10_qs;
  logic [31:0] spikes_10_wd;
  logic spikes_10_we;
  logic [31:0] spikes_11_qs;
  logic [31:0] spikes_11_wd;
  logic spikes_11_we;
  logic [31:0] spikes_12_qs;
  logic [31:0] spikes_12_wd;
  logic spikes_12_we;
  logic [31:0] spikes_13_qs;
  logic [31:0] spikes_13_wd;
  logic spikes_13_we;
  logic [31:0] spikes_14_qs;
  logic [31:0] spikes_14_wd;
  logic spikes_14_we;
  logic [31:0] spikes_15_qs;
  logic [31:0] spikes_15_wd;
  logic spikes_15_we;
  logic [31:0] spikes_16_qs;
  logic [31:0] spikes_16_wd;
  logic spikes_16_we;
  logic [31:0] spikes_17_qs;
  logic [31:0] spikes_17_wd;
  logic spikes_17_we;
  logic [31:0] spikes_18_qs;
  logic [31:0] spikes_18_wd;
  logic spikes_18_we;
  logic [31:0] spikes_19_qs;
  logic [31:0] spikes_19_wd;
  logic spikes_19_we;
  logic [31:0] spikes_20_qs;
  logic [31:0] spikes_20_wd;
  logic spikes_20_we;
  logic [31:0] spikes_21_qs;
  logic [31:0] spikes_21_wd;
  logic spikes_21_we;
  logic [31:0] spikes_22_qs;
  logic [31:0] spikes_22_wd;
  logic spikes_22_we;
  logic [31:0] spikes_23_qs;
  logic [31:0] spikes_23_wd;
  logic spikes_23_we;
  logic [31:0] spikes_24_qs;
  logic [31:0] spikes_24_wd;
  logic spikes_24_we;
  logic [31:0] spikes_result_0_qs;
  logic spikes_result_0_re;
  logic [31:0] spikes_result_1_qs;
  logic spikes_result_1_re;
  logic [31:0] spikes_result_2_qs;
  logic spikes_result_2_re;
  logic [31:0] spikes_result_3_qs;
  logic spikes_result_3_re;
  logic ctrl1_sample_ready_qs;
  logic ctrl1_sample_ready_wd;
  logic ctrl1_sample_ready_we;
  logic ctrl1_start_qs;
  logic ctrl1_start_wd;
  logic ctrl1_start_we;
  logic status_sample_qs;
  logic status_sample_wd;
  logic status_sample_we;
  logic status_ready_qs;
  logic status_ready_wd;
  logic status_ready_we;

  // Register instances

  // Subregister 0 of Multireg spikes
  // R[spikes_0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_0_we),
    .wd     (spikes_0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[0].q ),

    // to register interface (read)
    .qs     (spikes_0_qs)
  );

  // Subregister 1 of Multireg spikes
  // R[spikes_1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_1 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_1_we),
    .wd     (spikes_1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[1].q ),

    // to register interface (read)
    .qs     (spikes_1_qs)
  );

  // Subregister 2 of Multireg spikes
  // R[spikes_2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_2 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_2_we),
    .wd     (spikes_2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[2].q ),

    // to register interface (read)
    .qs     (spikes_2_qs)
  );

  // Subregister 3 of Multireg spikes
  // R[spikes_3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_3 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_3_we),
    .wd     (spikes_3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[3].q ),

    // to register interface (read)
    .qs     (spikes_3_qs)
  );

  // Subregister 4 of Multireg spikes
  // R[spikes_4]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_4 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_4_we),
    .wd     (spikes_4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[4].q ),

    // to register interface (read)
    .qs     (spikes_4_qs)
  );

  // Subregister 5 of Multireg spikes
  // R[spikes_5]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_5 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_5_we),
    .wd     (spikes_5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[5].q ),

    // to register interface (read)
    .qs     (spikes_5_qs)
  );

  // Subregister 6 of Multireg spikes
  // R[spikes_6]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_6 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_6_we),
    .wd     (spikes_6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[6].q ),

    // to register interface (read)
    .qs     (spikes_6_qs)
  );

  // Subregister 7 of Multireg spikes
  // R[spikes_7]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_7 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_7_we),
    .wd     (spikes_7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[7].q ),

    // to register interface (read)
    .qs     (spikes_7_qs)
  );

  // Subregister 8 of Multireg spikes
  // R[spikes_8]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_8 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_8_we),
    .wd     (spikes_8_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[8].q ),

    // to register interface (read)
    .qs     (spikes_8_qs)
  );

  // Subregister 9 of Multireg spikes
  // R[spikes_9]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_9 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_9_we),
    .wd     (spikes_9_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[9].q ),

    // to register interface (read)
    .qs     (spikes_9_qs)
  );

  // Subregister 10 of Multireg spikes
  // R[spikes_10]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_10 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_10_we),
    .wd     (spikes_10_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[10].q ),

    // to register interface (read)
    .qs     (spikes_10_qs)
  );

  // Subregister 11 of Multireg spikes
  // R[spikes_11]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_11 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_11_we),
    .wd     (spikes_11_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[11].q ),

    // to register interface (read)
    .qs     (spikes_11_qs)
  );

  // Subregister 12 of Multireg spikes
  // R[spikes_12]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_12 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_12_we),
    .wd     (spikes_12_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[12].q ),

    // to register interface (read)
    .qs     (spikes_12_qs)
  );

  // Subregister 13 of Multireg spikes
  // R[spikes_13]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_13 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_13_we),
    .wd     (spikes_13_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[13].q ),

    // to register interface (read)
    .qs     (spikes_13_qs)
  );

  // Subregister 14 of Multireg spikes
  // R[spikes_14]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_14 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_14_we),
    .wd     (spikes_14_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[14].q ),

    // to register interface (read)
    .qs     (spikes_14_qs)
  );

  // Subregister 15 of Multireg spikes
  // R[spikes_15]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_15 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_15_we),
    .wd     (spikes_15_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[15].q ),

    // to register interface (read)
    .qs     (spikes_15_qs)
  );

  // Subregister 16 of Multireg spikes
  // R[spikes_16]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_16 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_16_we),
    .wd     (spikes_16_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[16].q ),

    // to register interface (read)
    .qs     (spikes_16_qs)
  );

  // Subregister 17 of Multireg spikes
  // R[spikes_17]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_17 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_17_we),
    .wd     (spikes_17_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[17].q ),

    // to register interface (read)
    .qs     (spikes_17_qs)
  );

  // Subregister 18 of Multireg spikes
  // R[spikes_18]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_18 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_18_we),
    .wd     (spikes_18_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[18].q ),

    // to register interface (read)
    .qs     (spikes_18_qs)
  );

  // Subregister 19 of Multireg spikes
  // R[spikes_19]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_19 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_19_we),
    .wd     (spikes_19_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[19].q ),

    // to register interface (read)
    .qs     (spikes_19_qs)
  );

  // Subregister 20 of Multireg spikes
  // R[spikes_20]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_20 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_20_we),
    .wd     (spikes_20_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[20].q ),

    // to register interface (read)
    .qs     (spikes_20_qs)
  );

  // Subregister 21 of Multireg spikes
  // R[spikes_21]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_21 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_21_we),
    .wd     (spikes_21_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[21].q ),

    // to register interface (read)
    .qs     (spikes_21_qs)
  );

  // Subregister 22 of Multireg spikes
  // R[spikes_22]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_22 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_22_we),
    .wd     (spikes_22_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[22].q ),

    // to register interface (read)
    .qs     (spikes_22_qs)
  );

  // Subregister 23 of Multireg spikes
  // R[spikes_23]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_23 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_23_we),
    .wd     (spikes_23_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[23].q ),

    // to register interface (read)
    .qs     (spikes_23_qs)
  );

  // Subregister 24 of Multireg spikes
  // R[spikes_24]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_spikes_24 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (spikes_24_we),
    .wd     (spikes_24_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.spikes[24].q ),

    // to register interface (read)
    .qs     (spikes_24_qs)
  );



  // Subregister 0 of Multireg spikes_result
  // R[spikes_result_0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_spikes_result_0 (
    .re     (spikes_result_0_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.spikes_result[0].d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (spikes_result_0_qs)
  );

  // Subregister 1 of Multireg spikes_result
  // R[spikes_result_1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_spikes_result_1 (
    .re     (spikes_result_1_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.spikes_result[1].d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (spikes_result_1_qs)
  );

  // Subregister 2 of Multireg spikes_result
  // R[spikes_result_2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_spikes_result_2 (
    .re     (spikes_result_2_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.spikes_result[2].d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (spikes_result_2_qs)
  );

  // Subregister 3 of Multireg spikes_result
  // R[spikes_result_3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_spikes_result_3 (
    .re     (spikes_result_3_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.spikes_result[3].d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (spikes_result_3_qs)
  );


  // R[ctrl1]: V(False)

  //   F[sample_ready]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ctrl1_sample_ready (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl1_sample_ready_we),
    .wd     (ctrl1_sample_ready_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ctrl1.sample_ready.q ),

    // to register interface (read)
    .qs     (ctrl1_sample_ready_qs)
  );


  //   F[start]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ctrl1_start (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl1_start_we),
    .wd     (ctrl1_start_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ctrl1.start.q ),

    // to register interface (read)
    .qs     (ctrl1_start_qs)
  );


  // R[status]: V(False)

  //   F[sample]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_status_sample (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (status_sample_we),
    .wd     (status_sample_wd),

    // from internal hardware
    .de     (hw2reg.status.sample.de),
    .d      (hw2reg.status.sample.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_sample_qs)
  );


  //   F[ready]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_status_ready (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (status_ready_we),
    .wd     (status_ready_wd),

    // from internal hardware
    .de     (hw2reg.status.ready.de),
    .d      (hw2reg.status.ready.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_ready_qs)
  );




  logic [30:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == SPIKER_ADAPTER_SPIKES_0_OFFSET);
    addr_hit[ 1] = (reg_addr == SPIKER_ADAPTER_SPIKES_1_OFFSET);
    addr_hit[ 2] = (reg_addr == SPIKER_ADAPTER_SPIKES_2_OFFSET);
    addr_hit[ 3] = (reg_addr == SPIKER_ADAPTER_SPIKES_3_OFFSET);
    addr_hit[ 4] = (reg_addr == SPIKER_ADAPTER_SPIKES_4_OFFSET);
    addr_hit[ 5] = (reg_addr == SPIKER_ADAPTER_SPIKES_5_OFFSET);
    addr_hit[ 6] = (reg_addr == SPIKER_ADAPTER_SPIKES_6_OFFSET);
    addr_hit[ 7] = (reg_addr == SPIKER_ADAPTER_SPIKES_7_OFFSET);
    addr_hit[ 8] = (reg_addr == SPIKER_ADAPTER_SPIKES_8_OFFSET);
    addr_hit[ 9] = (reg_addr == SPIKER_ADAPTER_SPIKES_9_OFFSET);
    addr_hit[10] = (reg_addr == SPIKER_ADAPTER_SPIKES_10_OFFSET);
    addr_hit[11] = (reg_addr == SPIKER_ADAPTER_SPIKES_11_OFFSET);
    addr_hit[12] = (reg_addr == SPIKER_ADAPTER_SPIKES_12_OFFSET);
    addr_hit[13] = (reg_addr == SPIKER_ADAPTER_SPIKES_13_OFFSET);
    addr_hit[14] = (reg_addr == SPIKER_ADAPTER_SPIKES_14_OFFSET);
    addr_hit[15] = (reg_addr == SPIKER_ADAPTER_SPIKES_15_OFFSET);
    addr_hit[16] = (reg_addr == SPIKER_ADAPTER_SPIKES_16_OFFSET);
    addr_hit[17] = (reg_addr == SPIKER_ADAPTER_SPIKES_17_OFFSET);
    addr_hit[18] = (reg_addr == SPIKER_ADAPTER_SPIKES_18_OFFSET);
    addr_hit[19] = (reg_addr == SPIKER_ADAPTER_SPIKES_19_OFFSET);
    addr_hit[20] = (reg_addr == SPIKER_ADAPTER_SPIKES_20_OFFSET);
    addr_hit[21] = (reg_addr == SPIKER_ADAPTER_SPIKES_21_OFFSET);
    addr_hit[22] = (reg_addr == SPIKER_ADAPTER_SPIKES_22_OFFSET);
    addr_hit[23] = (reg_addr == SPIKER_ADAPTER_SPIKES_23_OFFSET);
    addr_hit[24] = (reg_addr == SPIKER_ADAPTER_SPIKES_24_OFFSET);
    addr_hit[25] = (reg_addr == SPIKER_ADAPTER_SPIKES_RESULT_0_OFFSET);
    addr_hit[26] = (reg_addr == SPIKER_ADAPTER_SPIKES_RESULT_1_OFFSET);
    addr_hit[27] = (reg_addr == SPIKER_ADAPTER_SPIKES_RESULT_2_OFFSET);
    addr_hit[28] = (reg_addr == SPIKER_ADAPTER_SPIKES_RESULT_3_OFFSET);
    addr_hit[29] = (reg_addr == SPIKER_ADAPTER_CTRL1_OFFSET);
    addr_hit[30] = (reg_addr == SPIKER_ADAPTER_STATUS_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = (reg_we &
              ((addr_hit[ 0] & (|(SPIKER_ADAPTER_PERMIT[ 0] & ~reg_be))) |
               (addr_hit[ 1] & (|(SPIKER_ADAPTER_PERMIT[ 1] & ~reg_be))) |
               (addr_hit[ 2] & (|(SPIKER_ADAPTER_PERMIT[ 2] & ~reg_be))) |
               (addr_hit[ 3] & (|(SPIKER_ADAPTER_PERMIT[ 3] & ~reg_be))) |
               (addr_hit[ 4] & (|(SPIKER_ADAPTER_PERMIT[ 4] & ~reg_be))) |
               (addr_hit[ 5] & (|(SPIKER_ADAPTER_PERMIT[ 5] & ~reg_be))) |
               (addr_hit[ 6] & (|(SPIKER_ADAPTER_PERMIT[ 6] & ~reg_be))) |
               (addr_hit[ 7] & (|(SPIKER_ADAPTER_PERMIT[ 7] & ~reg_be))) |
               (addr_hit[ 8] & (|(SPIKER_ADAPTER_PERMIT[ 8] & ~reg_be))) |
               (addr_hit[ 9] & (|(SPIKER_ADAPTER_PERMIT[ 9] & ~reg_be))) |
               (addr_hit[10] & (|(SPIKER_ADAPTER_PERMIT[10] & ~reg_be))) |
               (addr_hit[11] & (|(SPIKER_ADAPTER_PERMIT[11] & ~reg_be))) |
               (addr_hit[12] & (|(SPIKER_ADAPTER_PERMIT[12] & ~reg_be))) |
               (addr_hit[13] & (|(SPIKER_ADAPTER_PERMIT[13] & ~reg_be))) |
               (addr_hit[14] & (|(SPIKER_ADAPTER_PERMIT[14] & ~reg_be))) |
               (addr_hit[15] & (|(SPIKER_ADAPTER_PERMIT[15] & ~reg_be))) |
               (addr_hit[16] & (|(SPIKER_ADAPTER_PERMIT[16] & ~reg_be))) |
               (addr_hit[17] & (|(SPIKER_ADAPTER_PERMIT[17] & ~reg_be))) |
               (addr_hit[18] & (|(SPIKER_ADAPTER_PERMIT[18] & ~reg_be))) |
               (addr_hit[19] & (|(SPIKER_ADAPTER_PERMIT[19] & ~reg_be))) |
               (addr_hit[20] & (|(SPIKER_ADAPTER_PERMIT[20] & ~reg_be))) |
               (addr_hit[21] & (|(SPIKER_ADAPTER_PERMIT[21] & ~reg_be))) |
               (addr_hit[22] & (|(SPIKER_ADAPTER_PERMIT[22] & ~reg_be))) |
               (addr_hit[23] & (|(SPIKER_ADAPTER_PERMIT[23] & ~reg_be))) |
               (addr_hit[24] & (|(SPIKER_ADAPTER_PERMIT[24] & ~reg_be))) |
               (addr_hit[25] & (|(SPIKER_ADAPTER_PERMIT[25] & ~reg_be))) |
               (addr_hit[26] & (|(SPIKER_ADAPTER_PERMIT[26] & ~reg_be))) |
               (addr_hit[27] & (|(SPIKER_ADAPTER_PERMIT[27] & ~reg_be))) |
               (addr_hit[28] & (|(SPIKER_ADAPTER_PERMIT[28] & ~reg_be))) |
               (addr_hit[29] & (|(SPIKER_ADAPTER_PERMIT[29] & ~reg_be))) |
               (addr_hit[30] & (|(SPIKER_ADAPTER_PERMIT[30] & ~reg_be)))));
  end

  assign spikes_0_we = addr_hit[0] & reg_we & !reg_error;
  assign spikes_0_wd = reg_wdata[31:0];

  assign spikes_1_we = addr_hit[1] & reg_we & !reg_error;
  assign spikes_1_wd = reg_wdata[31:0];

  assign spikes_2_we = addr_hit[2] & reg_we & !reg_error;
  assign spikes_2_wd = reg_wdata[31:0];

  assign spikes_3_we = addr_hit[3] & reg_we & !reg_error;
  assign spikes_3_wd = reg_wdata[31:0];

  assign spikes_4_we = addr_hit[4] & reg_we & !reg_error;
  assign spikes_4_wd = reg_wdata[31:0];

  assign spikes_5_we = addr_hit[5] & reg_we & !reg_error;
  assign spikes_5_wd = reg_wdata[31:0];

  assign spikes_6_we = addr_hit[6] & reg_we & !reg_error;
  assign spikes_6_wd = reg_wdata[31:0];

  assign spikes_7_we = addr_hit[7] & reg_we & !reg_error;
  assign spikes_7_wd = reg_wdata[31:0];

  assign spikes_8_we = addr_hit[8] & reg_we & !reg_error;
  assign spikes_8_wd = reg_wdata[31:0];

  assign spikes_9_we = addr_hit[9] & reg_we & !reg_error;
  assign spikes_9_wd = reg_wdata[31:0];

  assign spikes_10_we = addr_hit[10] & reg_we & !reg_error;
  assign spikes_10_wd = reg_wdata[31:0];

  assign spikes_11_we = addr_hit[11] & reg_we & !reg_error;
  assign spikes_11_wd = reg_wdata[31:0];

  assign spikes_12_we = addr_hit[12] & reg_we & !reg_error;
  assign spikes_12_wd = reg_wdata[31:0];

  assign spikes_13_we = addr_hit[13] & reg_we & !reg_error;
  assign spikes_13_wd = reg_wdata[31:0];

  assign spikes_14_we = addr_hit[14] & reg_we & !reg_error;
  assign spikes_14_wd = reg_wdata[31:0];

  assign spikes_15_we = addr_hit[15] & reg_we & !reg_error;
  assign spikes_15_wd = reg_wdata[31:0];

  assign spikes_16_we = addr_hit[16] & reg_we & !reg_error;
  assign spikes_16_wd = reg_wdata[31:0];

  assign spikes_17_we = addr_hit[17] & reg_we & !reg_error;
  assign spikes_17_wd = reg_wdata[31:0];

  assign spikes_18_we = addr_hit[18] & reg_we & !reg_error;
  assign spikes_18_wd = reg_wdata[31:0];

  assign spikes_19_we = addr_hit[19] & reg_we & !reg_error;
  assign spikes_19_wd = reg_wdata[31:0];

  assign spikes_20_we = addr_hit[20] & reg_we & !reg_error;
  assign spikes_20_wd = reg_wdata[31:0];

  assign spikes_21_we = addr_hit[21] & reg_we & !reg_error;
  assign spikes_21_wd = reg_wdata[31:0];

  assign spikes_22_we = addr_hit[22] & reg_we & !reg_error;
  assign spikes_22_wd = reg_wdata[31:0];

  assign spikes_23_we = addr_hit[23] & reg_we & !reg_error;
  assign spikes_23_wd = reg_wdata[31:0];

  assign spikes_24_we = addr_hit[24] & reg_we & !reg_error;
  assign spikes_24_wd = reg_wdata[31:0];

  assign spikes_result_0_re = addr_hit[25] & reg_re & !reg_error;

  assign spikes_result_1_re = addr_hit[26] & reg_re & !reg_error;

  assign spikes_result_2_re = addr_hit[27] & reg_re & !reg_error;

  assign spikes_result_3_re = addr_hit[28] & reg_re & !reg_error;

  assign ctrl1_sample_ready_we = addr_hit[29] & reg_we & !reg_error;
  assign ctrl1_sample_ready_wd = reg_wdata[0];

  assign ctrl1_start_we = addr_hit[29] & reg_we & !reg_error;
  assign ctrl1_start_wd = reg_wdata[1];

  assign status_sample_we = addr_hit[30] & reg_we & !reg_error;
  assign status_sample_wd = reg_wdata[0];

  assign status_ready_we = addr_hit[30] & reg_we & !reg_error;
  assign status_ready_wd = reg_wdata[1];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[31:0] = spikes_0_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[31:0] = spikes_1_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[31:0] = spikes_2_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[31:0] = spikes_3_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[31:0] = spikes_4_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = spikes_5_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = spikes_6_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[31:0] = spikes_7_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[31:0] = spikes_8_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[31:0] = spikes_9_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[31:0] = spikes_10_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[31:0] = spikes_11_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = spikes_12_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[31:0] = spikes_13_qs;
      end

      addr_hit[14]: begin
        reg_rdata_next[31:0] = spikes_14_qs;
      end

      addr_hit[15]: begin
        reg_rdata_next[31:0] = spikes_15_qs;
      end

      addr_hit[16]: begin
        reg_rdata_next[31:0] = spikes_16_qs;
      end

      addr_hit[17]: begin
        reg_rdata_next[31:0] = spikes_17_qs;
      end

      addr_hit[18]: begin
        reg_rdata_next[31:0] = spikes_18_qs;
      end

      addr_hit[19]: begin
        reg_rdata_next[31:0] = spikes_19_qs;
      end

      addr_hit[20]: begin
        reg_rdata_next[31:0] = spikes_20_qs;
      end

      addr_hit[21]: begin
        reg_rdata_next[31:0] = spikes_21_qs;
      end

      addr_hit[22]: begin
        reg_rdata_next[31:0] = spikes_22_qs;
      end

      addr_hit[23]: begin
        reg_rdata_next[31:0] = spikes_23_qs;
      end

      addr_hit[24]: begin
        reg_rdata_next[31:0] = spikes_24_qs;
      end

      addr_hit[25]: begin
        reg_rdata_next[31:0] = spikes_result_0_qs;
      end

      addr_hit[26]: begin
        reg_rdata_next[31:0] = spikes_result_1_qs;
      end

      addr_hit[27]: begin
        reg_rdata_next[31:0] = spikes_result_2_qs;
      end

      addr_hit[28]: begin
        reg_rdata_next[31:0] = spikes_result_3_qs;
      end

      addr_hit[29]: begin
        reg_rdata_next[0] = ctrl1_sample_ready_qs;
        reg_rdata_next[1] = ctrl1_start_qs;
      end

      addr_hit[30]: begin
        reg_rdata_next[0] = status_sample_qs;
        reg_rdata_next[1] = status_ready_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Unused signal tieoff

  // wdata / byte enable are not always fully used
  // add a blanket unused statement to handle lint waivers
  logic unused_wdata;
  logic unused_be;
  assign unused_wdata = ^reg_wdata;
  assign unused_be = ^reg_be;

  // Assertions for Register Interface
  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

endmodule

module spiker_adapter_reg_top_intf
#(
  parameter int AW = 7,
  localparam int DW = 32
) (
  input logic clk_i,
  input logic rst_ni,
  REG_BUS.in  regbus_slave,
  // To HW
  output spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t reg2hw, // Write
  input  spiker_adapter_reg_pkg::spiker_adapter_hw2reg_t hw2reg, // Read
  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);
 localparam int unsigned STRB_WIDTH = DW/8;

`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

  // Define structs for reg_bus
  typedef logic [AW-1:0] addr_t;
  typedef logic [DW-1:0] data_t;
  typedef logic [STRB_WIDTH-1:0] strb_t;
  `REG_BUS_TYPEDEF_ALL(reg_bus, addr_t, data_t, strb_t)

  reg_bus_req_t s_reg_req;
  reg_bus_rsp_t s_reg_rsp;
  
  // Assign SV interface to structs
  `REG_BUS_ASSIGN_TO_REQ(s_reg_req, regbus_slave)
  `REG_BUS_ASSIGN_FROM_RSP(regbus_slave, s_reg_rsp)

  

  spiker_adapter_reg_top #(
    .reg_req_t(reg_bus_req_t),
    .reg_rsp_t(reg_bus_rsp_t),
    .AW(AW)
  ) i_regs (
    .clk_i,
    .rst_ni,
    .reg_req_i(s_reg_req),
    .reg_rsp_o(s_reg_rsp),
    .reg2hw, // Write
    .hw2reg, // Read
    .devmode_i
  );
  
endmodule


