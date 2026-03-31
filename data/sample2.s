addi	x10, x0, 5
addi	x11, x0, 171
add	x12, x0, x0
beq	x0, x10, 18
ld	x5, 0(x0)
ld	x6, 8(x0)
ld	x7, 16(x0)
addi	x10, x10, -1
addi	x5, x5, 1
addi	x6, x6, 1
addi	x7, x7, 1 
beq	x0, x12, -16
beq	x11, x5, 8
addi	x5, x5, 1
addi	x6, x6, 1
addi	x7, x7, 1
addi	x5, x5, 2
addi	x6, x6, 2
addi	x7, x7, 2
halt
