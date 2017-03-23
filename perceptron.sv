`default_nettype none
`timescale 1ns / 100ps

// 組み合わせ回路
module perceptron(input clk,
                  input [15:0] a, b, w,
                  output [15:0] out);

   assign out = a*w + b*w;

endmodule

module perceptron_test();
   reg clk;
   reg [15:0] a, b, w;
   wire [15:0] out;
   parameter CLK_PERIOD = 10;

   perceptron p(.a(a), .b(b), .w(w), .out(out), .clk(clk));

   initial begin
      $dumpfile("perceptron_wave.vcd");
      $dumpvars(0, p);

      clk = 1'b0;
      a = 10;
      b = 3;
      w = 5;
   end

   always #(CLK_PERIOD/2) clk <= ~clk;

   initial begin
      repeat (10) @(posedge clk);
      $finish;
   end

endmodule
