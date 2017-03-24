module Neural_net#(
  parameter BIT_WIDTH = 8,
  parameter NUM_NEURON = 3,
  parameter NUM_CLASS = 10
) (
  input wire [NUM_NEURON-1:0][BIT_WIDTH-1:0] in,
input wire [NUM_NEURON-1:0][NUM_CLASS-1:0][BIT_WIDTH-1:0] weights,
  input wire [NUM_CLASS-1:0][BIT_WIDTH-1:0] bias,
  output wire [NUM_CLASS-1:0][BIT_WIDTH-1:0] out
);
  wire [NUM_NEURON-1:0][NUM_CLASS-1:0][BIT_WIDTH-1:0] synapse;
  wire [NUM_CLASS-1:0][BIT_WIDTH-1:0] fire;

  assign out = fire;

  generate
    genvar i;

    for (i=0; i<NUM_NEURON; i=i+1) begin : neuron_loop
      Neuron neuron(.in(in[i]), .weights(weights[i]), .synapse(synapse[i]));
    end

    for (i=0; i<NUM_CLASS; i=i+1) begin : bias_loop
      Bias #(.NUM_NEURON(NUM_NEURON)) bias(.in({synapse[NUM_NEURON-1:0][i]}), .b(bias[i]), .out(fire[i]));
    end
  endgenerate

  Bias biasn(.in({synapse[NUM_NEURON-1+:0][0]}), .b(bias[i]), .out(fire[i]));
endmodule
