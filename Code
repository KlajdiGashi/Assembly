# t0 - base n
# t1 - a
# t2 - conditional value
# s1- result
# s2 - copy of n
# a0,v0 -  syscall


.data
String1: .asciiz " Enter a non-negative number: "
String2: .asciiz " Factorial of "
equiv:   .asciiz " = "

.text
.globl main

main:

    li $v0,4
    la $a0,String1
    syscall             # prints " Enter a non-negative number: "

    li $v0,5
    syscall             # for user input

    move $t0,$v0         # saving the input into t0 as the base of n
    
    move $s2,$t0        # saving the n into t2 as a copy
    # declared a and result as 1
    addi $t1,$zero,1    # a=1
    addi $s1,$zero,1    # result=1

    Factorial:
      slti	$t2, $s2, 1		    # $t0 = ($s0 < $s1) ? 1 : 0
      bne	$t2, 0, printimi	# if $t0 != $t1 then goto printimi
      # shumezimi 
      mul $s1,$s1,$t1   # result=result*a

      mul $s1,$s1,$s2   # result=result*n

      addi $s2,$s2,-1   # decrements n

      j Factorial

    printimi:
      li $v0, 4
	    la $a0, String2
	    syscall					# prints "Factorial of "

	    li $v0, 1
	    move $a0, $t0
	    syscall					# prints the original n

	    li $v0, 4
	    la $a0, equiv
	    syscall					# prints " = "

	    li $v0, 1
	    move $a0, $s1
	    syscall					# prints factorial value
