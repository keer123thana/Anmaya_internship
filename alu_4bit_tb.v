`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 19:05:33
// Design Name: 
// Module Name: alu_4bit_tb
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


module alu_4bit_tb;


    reg [3:0] a, b;
    reg [2:0] op;
    wire [3:0] result;
    wire       carry_flag;

    // Instantiate ALU module
    alu_4bit uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry_flag(carry_flag)
    );

    initial begin
        $display("Time\tOP\tA\tB\tResult\tCarry");

        // ADDITION: 5 + 3 = 8
        a = 4'b0101; b = 4'b0011; op = 3'b000; #10;
        $display("%g\t000\t%d\t%d\t%d\t%b", $time, a, b, result, carry_flag);

        // SUBTRACTION: 5 - 3 = 2
        op = 3'b001; #10;
        $display("%g\t001\t%d\t%d\t%d\t%b", $time, a, b, result, carry_flag);

        // AND: 0101 & 0011 = 0001
        op = 3'b010; #10;
        $display("%g\t010\t%04b\t%04b\t%04b\t-", $time, a, b, result);

        // OR: 0101 | 0011 = 0111
        op = 3'b011; #10;
        $display("%g\t011\t%04b\t%04b\t%04b\t-", $time, a, b, result);

        // XOR: 0101 ^ 0011 = 0110
        op = 3'b100; #10;
        $display("%g\t100\t%04b\t%04b\t%04b\t-", $time, a, b, result);

        // PASS A
        op = 3'b101; #10;
        $display("%g\t101\t%04b\t----\t%04b\t-", $time, a, result);

        // PASS B
        op = 3'b110; #10;
        $display("%g\t110\t----\t%04b\t%04b\t-", $time, b, result);

        // CLEAR
        op = 3'b111; #10;
        $display("%g\t111\t----\t----\t%04b\t-", $time, result);

        $stop;
    end
endmodule
    