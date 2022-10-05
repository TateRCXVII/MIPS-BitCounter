    .data           #variable used follow this line
prompt1: .asciiz  "Enter a number: "
prompt2: .asciiz  "\n The number of set bits from 0 to your number is: "
                    .globl main
.text               #program's code after this line
.globl main

main:
li  $v0,4           #System call code for print string
la  $a0,prompt1     #Load address of the prompt1 string
syscall             #call OS to Print prompt1

li  $v0,5           #System call code for read integer
syscall             #call OS to read integer

move $t0,$v0        #move the number entered by user to $t0

li  $t1,0           #initialize $t1 to 0 to count the number of set bits
li  $t2,0           #initialize $t2 to 0
move $t3,$t0

loopNum:
andi $t4,$t0,1      #and $t0 with 1 and store in $t4
add $t1,$t1,$t4     #add $t4 to $t1
srl $t0,$t0,1       #shift $t0 right by 1
beq $t0,$t2, decrement    #if $t0 is 0, jump to decrement
j loopNum           #jump to loop

decrement:
sub $t3,$t3,1      #decrement $t3 by 1
beq $t3,$t2, done  #if $t3 is 0, jump to print
move $t0,$t3       #move $t3 to $t0
j loopNum          #jump to loop

done:
li  $v0,4           #System call code for print string
la  $a0,prompt2     #Load address of the prompt2 string
syscall             #call OS to Print prompt2

li  $v0,1           #System call code for print integer
move $a0,$t1        #move the number of set bits to $a0
syscall             #call OS to Print the number of set bits

li $v0,10
syscall