jal x1, 4
addi x1, x0, -1
addi x2, x0, 20
jalr x3, 0(x2)
addi x3, x0, -1
sd x1, 0(x0)
sd x3, 8(x0)
halt