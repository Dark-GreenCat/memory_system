//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sun Apr 20 13:32:11 2025
//Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target memory_system_wrapper.bd
//Design      : memory_system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module memory_system_wrapper
   (default_300mhz_clk0_clk_n,
    default_300mhz_clk0_clk_p,
    resetn,
    ui_clk);
  input default_300mhz_clk0_clk_n;
  input default_300mhz_clk0_clk_p;
  input resetn;
  output ui_clk;

  wire default_300mhz_clk0_clk_n;
  wire default_300mhz_clk0_clk_p;
  wire resetn;
  wire ui_clk;

  memory_system memory_system_i
       (.default_300mhz_clk0_clk_n(default_300mhz_clk0_clk_n),
        .default_300mhz_clk0_clk_p(default_300mhz_clk0_clk_p),
        .resetn(resetn),
        .ui_clk(ui_clk));
endmodule
