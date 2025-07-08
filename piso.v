`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 18:50:06
// Design Name: 
// Module Name: piso
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module piso(
    input        clk,         // Clock signal
    input        reset,       // Asynchronous reset
    input        load,        // Load control signal
    input  [3:0] data_in,     // 4-bit parallel input
    output       serial_out   // Serial output
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000;
        else if (load)
            shift_reg <= data_in;
        else
            shift_reg <= {shift_reg[2:0], 1'b0};  // Shift left, fill with zero
    end

    assign serial_out = shift_reg[3];  // MSB shifts out first

endmodule
    