`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 18:51:39
// Design Name: 
// Module Name: piso_tb
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


module piso_tb;

    reg        clk, reset, load;
    reg  [3:0] data_in;
    wire       serial_out;

    piso  uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .serial_out(serial_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tLoad\tData_in\tSerial_out");
        reset = 1; load = 0; data_in = 4'b0000; #10;
        reset = 0;

        // Load 4-bit data
        data_in = 4'b1011; load = 1; #10;
        load = 0;

        // Shift out bits one by one
        repeat (4) begin
            #10;
            $display("%g\t%b\t%04b\t%b", $time, load, data_in, serial_out);
        end

        // Test second data pattern
        data_in = 4'b1100; load = 1; #10;
        load = 0;

        repeat (4) begin
            #10;
            $display("%g\t%b\t%04b\t%b", $time, load, data_in, serial_out);
        end

        $stop;
    end

endmodule
  