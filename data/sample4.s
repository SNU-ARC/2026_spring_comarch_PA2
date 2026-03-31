addi	x5, x0, 1
addi	x6, x0, 2
addi    x7, x0, 3
add	x28, x5, x6
sub	x28, x7, x6 
add	x30, x28, x7
add     x18, x5, x30  
and	x19, x18, x7
xor	x20, x5, x18
add	x21, x19, x5
halt
