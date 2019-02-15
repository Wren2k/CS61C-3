.data
allowed_chars: .asciiz "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
number: .asciiz "ABCD"
base: .word 16

.text
validate_number:
    # YOUR CODE HERE

    # Before this line, you should set a0 to be 1 or 0 depending on the
    # validity of the given number and base.
    add a1, x0, a0
    addi a1, a1, 48
    addi a0, x0, 11
    ecall

    addi a0, x0, 10
    ecall #Terminate the program

validate_number_char:
    # a0 is the character, a1 is the base
    add t0, a0, x0
    addi t1, a1, -1
    la t2, allowed_chars
char_loop:
    blt t1, x0, failure
    slli t3, t1, 2
    add t4, t2, t3
    lw t5, 0(t4)
    beq t0, t5, success
    j char_loop
success:
    addi a0, x0, 1
    j char_exit
failure:
    addi a0, x0, 0
char_exit:
    ret
