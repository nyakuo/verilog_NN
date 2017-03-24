module Bias#(
  parameter BIT_WIDTH = 8,
  parameter NUM_NEURON = 784
)(
  input wire [NUM_NEURON-1:0][BIT_WIDTH-1:0] in,
  input wire [BIT_WIDTH-1:0] b,
  output wire [BIT_WIDTH-1:0] out
);

  assign out = sum_and_bias(in, b);

  function [BIT_WIDTH-1:0] sum_and_bias;
    input [NUM_NEURON-1:0][BIT_WIDTH-1:0] in;
    input wire [BIT_WIDTH-1:0] b;

    int i;
    begin
      sum_and_bias = 0;
      for (i=0; i<NUM_NEURON; i=i+1) begin
        sum_and_bias = sum_and_bias + in[i];
      end
      sum_and_bias = sum_and_bias + b;
    end
  endfunction

endmodule
