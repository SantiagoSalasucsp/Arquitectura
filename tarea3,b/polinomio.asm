# polinomio_float.asm

# SECCION DE INSTRUCCIONES (.text)
.text
.globl __start

__start:

# pedir grado del polinomio
li $v0, 4
la $a0, mensajeGrado
syscall

li $v0, 5
syscall

move $t0, $v0   # $t0 guarda el grado n
move $t6, $t0   # $t6 guarda el grado original del polinomio

# reservar memoria para coeficientes
li $t1, 4      # tama�o de un float en bytes
mul $t1, $t0, $t1
addi $t1, $t1, 4  # un espacio extra para el t�rmino constante a0
li $v0, 9
move $a0, $t1
syscall
move $t2, $v0   # $t2 apunta a la memoria reservada
move $t5, $v0   # $t5 guarda la direcci�n base de la memoria reservada

# Introducir coeficientes
introducirCoeficientes:
beq $t0, -1, introducirX  # si ya estan todos los coeficientes, pasa a introducir X
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
s.s $f0, 0($t2)   # almacenar coeficiente como punto flotante
addi $t2, $t2, 4 # mover al siguiente espacio de memoria
addi $t0, $t0, -1 # disminuir contador de coeficientes
j introducirCoeficientes

#ingrear x
introducirX:
li $v0, 4
la $a0, mensajeX
syscall
li $v0, 6
syscall
mov.s $f0, $f0   # $f0 guarda X

# Evaluar polinomio
move $t3, $t6     # inicializar contador para potencia de X
l.s $f1, cero_float  # inicializar el acumulador del resultado con 0
move $t2, $t5

evaluarPolinomio:
beq $t3, $zero, sumarIndependiente  # se debe sumar el ultimo termino
l.s $f4, 0($t2)     # cargar coeficiente actual como punto flotante

# Calculamos X elevado a su respectiva potencia
li $t7, 0          # contador para elevaci�n
l.s $f5, uno_float # inicializar con 1 (ya que X^0 = 1)

potenciaX:
beq $t7, $t3, multiplicarCoeficiente
mul.s $f5, $f5, $f0  # se multiplica por X
addi $t7, $t7, 1     # incrementar el contador de potencia
j potenciaX

multiplicarCoeficiente:
mul.s $f4, $f4, $f5  # se multiplica el coeficiente por X elevado a su potencia
add.s $f1, $f1, $f4  # sumamos al acumulador

# Incrementar para la siguiente iteraci�n
addi $t2, $t2, 4     # mover al siguiente coeficiente
addi $t3, $t3, -1     # decrementar contador

j evaluarPolinomio

sumarIndependiente:
l.s $f4, 0($t2)     # coeficiente independiente como punto flotante
add.s $f1, $f1, $f4 # sumar al acumulador

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

# SECCION DE VARIABLES EN MEMORIA (.data)
.data
uno_float: .float 1.0
cero_float: .float 0.0
mensajeGrado: .asciiz "Introduce el grado n del polinomio: "
mensajeCoef: .asciiz "Introduce el coeficiente para a"
mensajeX: .asciiz "Introduce el valor de X: "
mensajeResultado: .asciiz "El resultado es: "
espacio: .asciiz " :"