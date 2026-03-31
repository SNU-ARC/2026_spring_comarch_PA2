/*-----------------------------------------------------------------------------

4190.308-002 Computer Architecture

Instructor: Prof. Jae W. Lee (jaewlee@snu.ac.kr)

Homework #2: RISC-V Single-Cycle CPU in Verilog

Description:
	This module is your single-cycle Verilog processor.

-----------------------------------------------------------------------------*/

module riscv_single_cycle
(
    input clk,
    input reset
);

    reg [63:0] pc;

    wire [31:0] inst;

    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [63:0] imm64;
    wire beq;
    wire jal;
    wire jalr;

    wire [63:0] rs1_data;
    wire [63:0] rs2_data;

    wire alu_lhs_select;
    wire alu_rhs_select;
    wire mem_to_reg;
    wire reg_write;
    wire mem_read;
    wire mem_write;
    wire [2:0] alu_op;
    wire halt;

    wire [63:0] alu_lhs;
    wire [63:0] alu_rhs;
    wire [63:0] alu_result;
    wire alu_zero;
    wire alu_sign;

    wire [63:0] mem_read_data;
    wire [63:0] wb_write_data;

    wire branch_taken;
    wire [63:0] branch_target;
    wire [63:0] next_pc;

    rom64 imem(
        .address(pc),
        .data_out(inst)
    );

    inst_decoder decoder(
        .inst(inst),
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm64(imm64),
        .beq(beq),
        .jal(jal),
        .jalr(jalr)
    );

    control ctl(
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .alu_lhs_select(alu_lhs_select),
        .alu_rhs_select(alu_rhs_select),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_operation(alu_op),
        .halt(halt)
    );

    reg_file rf(
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .rd(rd),
        .write(reg_write),
        .write_data(wb_write_data)
    );

    assign alu_lhs = alu_lhs_select ? pc : rs1_data;
    assign alu_rhs = alu_rhs_select ? imm64 : rs2_data;

    alu execute_alu(
        .op(alu_op),
        .lhs(alu_lhs),
        .rhs(alu_rhs),
        .result(alu_result),
        .zero(alu_zero),
        .sign(alu_sign)
    );

    mem64 dmem(
        .clk(clk),
        .write_enable(mem_write),
        .halt(halt),
        .address(alu_result),
        .write_data(rs2_data),
        .read_data(mem_read_data)
    );

    // TODO: implement the correct signals for these wires
    assign wb_write_data = 0;
    assign branch_taken = 0;
    assign branch_target = 0;
    assign next_pc = 0;


    always @(posedge clk)
    begin
        if (reset)
            pc <= 64'h0;
        else
            pc <= next_pc;
    end

endmodule
