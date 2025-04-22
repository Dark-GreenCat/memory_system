`timescale 1ns / 1ps

module sim_top_u250 ();
  reg clk;

  initial begin
    clk = 0;

    #2000;
    $finish;
  end

  always #5 clk = ~clk;

  // Clock generation
  wire clk_n;
  wire clk_p;
  assign clk_n = ~clk;
  assign clk_p = clk;

  // Instantiate the U250 design
  top_u250 u250 (
    .SYSCLK0_300_N(clk_n),
    .SYSCLK0_300_P(clk_p)
  );

  initial begin
    $dumpfile("sim_top_u250.vcd");
    $dumpvars(0, sim_top_u250);
  end

endmodule
