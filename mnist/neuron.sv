module Neuron #(
  parameter BIT_WIDTH = 8,
  parameter NUM_CLASS = 3
) (
  input wire [BIT_WIDTH-1:0] in,
  input wire  [NUM_CLASS-1:0][BIT_WIDTH-1:0] weights,
  output wire [NUM_CLASS-1:0][BIT_WIDTH-1:0] synapse
);

  generate
    genvar i;
    for (i=0; i<NUM_CLASS; i=i+1) begin : assign_loop
      assign synapse[i] = in * weights[i];
    end
  endgenerate
endmodule
