/*-----------------------------------------------------------------------------

4190.308-002 Computer Architecture

Instructor: Prof. Jae W. Lee (jaewlee@snu.ac.kr)

Homework #2: RISC-V Single-Cycle CPU in Verilog

Description:
	Instruction decoding unit.

-----------------------------------------------------------------------------*/

module inst_decoder
(
	input [31:0] inst,

	output [6:0] opcode,
	output [2:0] funct3,
	output [6:0] funct7,

	output [4:0] rs1,
	output [4:0] rs2,
	output [4:0] rd,

	output [63:0] imm64,

	output beq,
	output jal,
	output jalr
);

	assign opcode = inst[6:0];

	// opcodes
	// 0110011(R): add, sub, and, or, xor
	// 0010011(I): addi, andi, ori, xori
	// 0000011(I): ld
	// 0100011(S): sd
	// 1100011(S): beq
	// 1101111(J): jal
	// 1100111(I): jalr

	// TODO: implement correct outputs for these wires
	assign imm64 = (opcode == 7'b0110011) ? 64'h0 : 64'h0; // R type has no immediate
	assign beq = 0;
	assign jal = 0;
	assign jalr = 0;

endmodule
