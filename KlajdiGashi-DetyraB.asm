
# $t1 --> vargu
# $t2 --> i 
# $t3 --> conditional result
# $t4 --> n 
# $t5 --> elements
# $s0 --> input value which is saved into the Array
# $t0 --> temporary value
# $v0 --> saving the value from the user

.data
 
 Numrat: .asciiz "Enter 5 numbers: "
 Numratjane: .asciiz "The numbers are: "
 Vargu: .space 20
 endl: .asciiz "\n"
 quotation: .asciiz "   "
.text
.globl main 

main:

  move $t5,$zero

  la	     $t1,Vargu		            # At t1 save 20 bytes or 5 numbers so that we can input them
  li       $v0,4
  la       $a0,Numrat		            # Outputs "Enter 5 numbers: "
  syscall                

  li       $v0,4
  la       $a0,endl
  syscall
 
 Inputloop:
  slti	  $t3, $t2, 5			          # $t3 = ($t2 < 5) ? 1 : 0
  
  bne	  $t3, 1, Outputloop	        # if $t3 != 1 then goto exit
  addi	$t2, $t2, 1                 # increments i


  li	  $v0,5		                    # read user input
  syscall
  
 
  move $t0, $v0                     # moving the input value into $t0
  sw $t0,($t5)                      # storing the input value into the array
  
  addi $t5, $t5, 4
  
  j	 Inputloop				              # jump to Inputloop

  li $v0,4
  la $a1,Numratjane
  syscall                            # outputs " The numbers are: "

 Outputloop: 
  slti   $t3, $t4, 5			           # $t3 = ($t4 < 5) ? 1 : 0
  bne	   $t3, 1, end	               # if $t3 != 1 then goto exit
  
  lw $t6,($t5)
  
  li	$v0,1 
  move  $a0,$t6
  syscall                            # outputs the number
  
  addi  $t6,$t6,4
  addi	$t4, $t4, 1                  # increments n
  
  li $v0,4
  la $a0,quotation
  syscall

  j Outputloop   
    
  end:
  li $v0,10
  syscall