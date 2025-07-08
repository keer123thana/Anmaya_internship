`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 19:03:41
// Design Name: 
// Module Name: alu_4bit
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


module alu_4bit (
    input  [3:0] a,        // Operand A
    input  [3:0] b,        // Operand B
    input  [2:0] op,       // Opcode
    output reg [3:0] result, // ALU result
    output reg carry_flag    // Carry or Borrow flag
);

    wire [4:0] add_result = a + b;
    wire [4:0] sub_result = a - b;

    always @(*) begin
        carry_flag = 0;
        case (op)
            3'b000: begin  // Addition
                result = add_result[3:0];
                carry_flag = add_result[4];  // Carry out
            end
            3'b001: begin  // Subtraction
                result = sub_result[3:0];
                carry_flag = sub_result[4];  // Borrow flag
            end
            3'b010: result = a & b;          // AND
            3'b011: result = a | b;          // OR
            3'b100: result = a ^ b;          // XOR
            3'b101: result = a;              // Pass-through A
            3'b110: result = b;              // Pass-through B
            3'b111: result = 4'b0000;        // Clear
            default: result = 4'bxxxx;
        endcase
    end
endmodule
