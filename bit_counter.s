# implement a MIPS program that counts all set bits (the ones that are 1) 
# in numbers from 1 to N (including N). Specifically, your program asks a 
# user to input an integer number and then outputs a number of set bits. 
# For example, if the user enters 5, then if you look at binary representation 
# of all the numbers from 0 to 5 and their bits:
# 0b0 0b1 0b10 0b11 0b100 0b101 
# The sum of all set bits is 7.
# Note that the first number is 0, so it does not count.
# Your program should work for any positive integer number.
# Hint: you can use the following code to get the binary representation of a number:
# bin(5) # returns '0b101'
# Hint: you can use the following code to get the number of set bits in a binary representation:
# bin(5).count('1') # returns 2 
# Hint: you can use the following code to get the sum of all elements in a list:
# sum([1, 2, 3]) # returns 6

# Your code goes here

# Sample run:
# Enter a number: 5
# The number of set bits is 7

# Enter a number: 10
# The number of set bits is 17

# Enter a number: 100
# The number of set bits is 217

# Enter a number: 1000
# The number of set bits is 2017

    .data           #variable used follow this line
prompt1: .asciiz  "Enter a number:"
prompt2: .asciiz  "\n The number of set bits from 1 to your number is:"
                    .globl main
.text               #program's code after this line

  main:
li  $v0,4           #System call code for print string
la  $a0,prompt1     #Load address of the prompt1 string
syscall             #call OS to Print prompt1