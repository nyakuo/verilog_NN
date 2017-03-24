module Max#(
  parameter BIT_WIDTH = 8
  )(
  input [BIT_WIDTH-1:0] in0, in1,
  output [BIT_WIDTH-1:0] out
);
  assign out = in0 > in1 ? in0 : in1;
endmodule

module Softmax#(
  parameter BIT_WIDTH = 8,
  parameter NUM_CLASS = 10
  )(
  input clk,
  input [NUM_CLASS-1:0][BIT_WIDTH-1:0] in,
  output [NUM_CLASS-1:0][BIT_WIDTH-1:0] Y
);
  wire [BIT_WIDTH-1:0] w1_1, w1_2, w1, w2_1, w2_2, w2;

  Max m1_1(.in1(in[0]), .in2(in[1]), .out(w1_1));
  Max m1_2(.in1(in[2]), .in2(in[3]), .out(w1_2));
  Max m1(.in1(w1_1), .in2(w1_2), .out(w1));

  Max m2_1(.in1(in[4]), .in2(in[5]), .out(w2_1));
  Max m2_2(.in1(in[6]), .in2(in[7]), .out(w2_2));
  Max m2(.in1(w2_1), .in2(w2_2), .out(w2));

  max m(.in1(w1), .in2(w2), .out(Y));
endmodule
