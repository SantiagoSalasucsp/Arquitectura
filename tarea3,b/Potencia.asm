.text

.globl multiplicacion_booth
multiplicacion_booth:

  move $v0, $zero
  move $v1, $zero

loop:

  andi $t0, $a1, 1

  bnez $t0, sumar
  add $v0, $v0, $a0
  add $v1, $v1, $zero
  b fin_loop

sumar:
  sub $v0, $v0, $a0
  add $v1, $v1, $a0

fin_loop:

  srl $a1, $a1, 1
  bnez $a1, loop

  jr $ra
