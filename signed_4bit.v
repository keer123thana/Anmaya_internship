`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 18:32:33
// Design Name: 
// Module Name: signed_4bit
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


module signed_4bit (
    input  [3:0] a,          // 4-bit signed input A
    input  [3:0] b,          // 4-bit signed input B
    output [4:0] sum,        // 5-bit signed result
    output       overflow    // Overflow flag
);

    wire [4:0] extended_a = {a[3], a};  // Sign-extend to 5 bits
    wire [4:0] extended_b = {b[3], b};

    assign sum = extended_a + extended_b;

    // Overflow detection
    assign overflow = (~a[3] & ~b[3] & sum[4]) | (a[3] & b[3] & ~sum[4]);

endmodule
   