/*-----------------------------------------------------------------------------

4190.308-002 Computer Architecture

Instructor: Prof. Jae W. Lee (jaewlee@snu.ac.kr)

Homework #2: RISC-V Single-Cycle CPU in Verilog

Description:
	This module is basic ALU with simple arithmetic/logic operation.
	It also provides two types of flag: zero and sign.

-----------------------------------------------------------------------------*/

module alu
(
	input [2:0] op,
	input [63:0] lhs,
	input [63:0] rhs,
	output [63:0] result,

	// Assume signed input only.
	output zero,	// Set 1 if result == 0
	output sign		// Set 1 if result < 0
);
	parameter ALU_NOP	= 3'b000;

	// TODO: implement correct outputs
	assign zero = 0;
	assign sign = 0;
	assign result = (op == ALU_NOP) ? 64'b0 : 64'b0;

endmodule
