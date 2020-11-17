# Source: MIPS Asseembly Language Programming Using QtSpim
#   URL: https://open.umn.edu/opentextbooks/textbooks/734
#
# Objectives: Use a stack to reverse a string
#
# ----------------------------------------------------
# Data Declarations

.data

string:     .asciiz     "Hello, World!"
length:     .word       13

# ----------------------------------------------------
# Text/code section
#
# Basic approach:
#   - loop to push each element onto the stack
#   - loop to pop each element off the stack
# Final result is all elements reversed.

.text 
.globl main
.ent main

main:
# ----
# Loop to read items from array and push to stack.

    la $t0, string      # get string's starting address
    li $t1, 0           # loop index, i=0
    lw $t2, length      # string length

pushLoop:
    lb $t4, ($t0)       # get array[i]

    subu $sp, $sp, 1    # push array[i] to stack
    sb $t4, ($sp)

    add $t1, $t1, 1     # i = i+1
    add $t0, $t0, 1     # update string address (1 byte)

    # if i < length, continue the loop
    blt $t1, $t2, pushLoop

# ----
# Loop to pop items from stack and write into array
    la $t0, string       # get string starting address
    li $t1, 0           # loop index, i=0
    lw $t2, length      # length (redundant line)

popLoop:
    lb $t4, ($sp)       # pop array[i]
    addu $sp, $sp, 1

    sb $t4, ($t0)       # set array[i]

    add $t1, $t1, 1     # i = i+1
    add $t0, $t0, 1     # update string addreess

    # if i < length, continue the loop
    blt $t1, $t2, popLoop

# ----
# Done, terrminate the program

    li $v0, 10
    syscall

.end main