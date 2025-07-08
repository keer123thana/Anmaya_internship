`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 18:33:45
// Design Name: 
// Module Name: signed_4bitadd_tb
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


module signed_4bitadd_tb;


    reg  [3:0] a, b;
    wire [4:0] sum;
    wire       overflow;

    signed_4bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .overflow(overflow)
    );

    initial begin
        $display("A\tB\tSum\tOverflow");

        a = 4'b0111; b = 4'b0001; #10; // 7 + 1 = 8
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        a = 4'b0100; b = 4'b0100; #10; // 4 + 4 = 8 (No overflow)
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        a = 4'b0111; b = 4'b0110; #10; // 7 + 6 = 13 (Overflow)
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        a = 4'b1000; b = 4'b1110; #10; // -8 + (-2) = -10
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        a = 4'b1101; b = 4'b1101; #10; // -3 + (-3) = -6
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        a = 4'b0101; b = 4'b1011; #10; // 5 + (-5) = 0
        $display("%d\t%d\t%d\t%b", $signed(a), $signed(b), $signed(sum), overflow);

        $stop;
    end

endmodule
    
