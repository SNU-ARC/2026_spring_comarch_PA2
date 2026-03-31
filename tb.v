/*-----------------------------------------------------------------------------

4190.308-002 Computer Architecture

Instructor: Prof. Jae W. Lee (jaewlee@snu.ac.kr)

Homework #2: RISC-V Single-Cycle CPU in Verilog

Description:
	This top module provides initial reset signal for the single-cycle CPU.

-----------------------------------------------------------------------------*/

module tb();

	reg clk;
	reg reset;

	riscv_single_cycle uut(.clk(clk), .reset(reset));

	initial
	begin
		$dumpfile("tb.vcd");
		$dumpvars(0, tb);

		clk <= 1;
		reset <= 1;
		#3;
		reset <= 0;
	end

	always #5 clk <= ~clk;

endmodule
