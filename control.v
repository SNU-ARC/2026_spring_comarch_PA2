/*-----------------------------------------------------------------------------

4190.308-002 Computer Architecture

Instructor: Prof. Jae W. Lee (jaewlee@snu.ac.kr)

Homework #2: RISC-V Single-Cycle CPU in Verilog

Description:
    Control signal generator for the single-cycle RISC-V CPU.

-----------------------------------------------------------------------------*/

module control
(
	//From ID unit: opcode and register
	input [6:0] opcode,
	input [2:0] funct3,
	input [6:0] funct7,

	//To others-
	output reg alu_lhs_select,
    output reg alu_rhs_select,
	output reg mem_to_reg,
	output reg reg_write,
	output reg mem_read,
	output reg mem_write,
	output reg [2:0] alu_operation,
	output reg halt
);
    // opcodes
    parameter NOP = 7'h0;

    // ALU operation encoding
	parameter ALU_NOP = 3'b000;

    // TODO: complete control signal generation logic for other opcodes
    always @(opcode, funct3, funct7)
    begin
        if (opcode == NOP)
        begin
            alu_lhs_select <= 1'b0;
            alu_rhs_select <= 1'b0;
            mem_to_reg <= 1'b0;
            reg_write <= 1'b0;
            mem_read <= 1'b0;
            mem_write <= 1'b0;
            halt <= 1'b0;
            alu_operation <= ALU_NOP;
        end
        else // halt
            begin
            alu_lhs_select <= 1'b0;
            alu_rhs_select <= 1'b0;
            mem_to_reg <= 1'b0;
            reg_write <= 1'b0;
            mem_read <= 1'b0;
            mem_write <= 1'b0;
            halt <= 1'b1;
            alu_operation <= ALU_NOP;
        end
    end

endmodule
