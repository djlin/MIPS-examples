### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Objectives:
###     Read two integers from keyboard, sum them up, and print the result to console
###
### Note:
###     This lab uses several operations, including I/O, arithmetic, and system call
###
### --------------------------
### This is the data segment
### --------------------------
    .data

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    # read two integers from keyboard
    li $v0, 5
    syscall

    # store the integer into $a0 (as an operand for addition)
    move $a0, $v0

    li $v0, 5
    syscall
    move $a1, $v0

    # sum them up and store the result in $a0 (for printing)
    add $a0, $a0, $a1

    # print the result
    li $v0, 1
    syscall

# Terminate the program
    li $v0, 10
    syscall

### End of file
