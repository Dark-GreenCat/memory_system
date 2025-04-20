`timescale 1ns / 1ps

module top_u250 (
  input SYSCLK0_300_N,
  input SYSCLK0_300_P
);
  reg rst_n = 1'b0;
  reg [63:0] clk_cnt = 64'b0;
  wire ui_clk;

  always @(posedge ui_clk) begin
    clk_cnt <= clk_cnt + 1;
    if (clk_cnt == 64'd10) begin
      rst_n <= 1'b1;
    end
  end

  memory_system_wrapper u_memory_system_wrapper (
    .default_300mhz_clk0_clk_n(SYSCLK0_300_N),
    .default_300mhz_clk0_clk_p(SYSCLK0_300_P),
    .resetn(rst_n),
    .ui_clk(ui_clk)
  );

endmodule
