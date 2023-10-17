.text
.globl __start

__start:

# pedir grado del polinomio
li $v0, 4
la $a0, mensajeGrado
syscall

li $v0, 5
syscall

move $t0, $v0
move $t6, $t0

# reservar memoria para coeficientes
li $t1, 4
mul $t1, $t0, $t1
addi $t1, $t1, 4
li $v0, 9
move $a0, $t1
syscall
move $t2, $v0
move $t5, $v0

# Introducir coeficientes
introducirCoeficientes:
beq $t0, -1, introducirX
li $v0, 4
la $a0, mensajeCoef
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, espacio
syscall

li $v0, 6
syscall
s.s $f0, 0($t2)
addi $t2, $t2, 4
addi $t0, $t0, -1
j introducirCoeficientes

#ingrear x
introducirX:
li $v0, 4
la $a0, mensajeX
syscall
li $v0, 6
syscall
mov.s $f0, $f0

# Evaluar polinomio
move $t3, $t6
l.s $f1, cero_float
move $t2, $t5

evaluarPolinomio:
beq $t3, $zero, sumarIndependiente
l.s $f4, 0($t2)

# Calculamos X elevado a su respectiva potencia
li $t7, 0
l.s $f5, uno_float

potenciaX:
beq $t7, $t3, multiplicarCoeficiente
mul.s $f5, $f5, $f0
addi $t7, $t7, 1
j potenciaX

multiplicarCoeficiente:
mul.s $f4, $f4, $f5
add.s $f1, $f1, $f4


addi $t2, $t2, 4
addi $t3, $t3, -1

j evaluarPolinomio

sumarIndependiente:
l.s $f4, 0($t2)
add.s $f1, $f1, $f4

mostrarResultado:
li $v0, 4
la $a0, mensajeResultado
syscall
li $v0, 2
mov.s $f12, $f1
syscall

fin:
li $v0, 10
syscall


.data
uno_float: .float 1.0
cero_float: .float 0.0
mensajeGrado: .asciiz "Introduce el grado n del polinomio: "
mensajeCoef: .asciiz "Introduce el coeficiente para a"
mensajeX: .asciiz "Introduce el valor de X: "
mensajeResultado: .asciiz "El resultado es: "
espacio: .asciiz " :"
