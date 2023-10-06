.data
array: .word 5, 10, 3, 8, 15, 20, 12, 26
size:  .word 8

.text
.globl main

main:
    la $a0, array
    lw $t1, size
    lw $t0, 0($a0)

    loop:
        lw $t2, 0($a0)
        bgt $t2, $t0, update_max
        addi $a0, $a0, 4
        subi $t1, $t1, 1
        bnez $t1, loop

    update_max:
        move $t0, $t2
        addi $a0, $a0, 4
        subi $t1, $t1, 1
        bnez $t1, loop

    done:
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall
