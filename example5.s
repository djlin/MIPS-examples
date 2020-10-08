### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This program demonstrates how to print a message on the screen

### --------------------------
### This is the data segment
### --------------------------
    .data

my_string: .asciiz  "Hello, World!"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $v0, 4           # system call #4 => print a message
    la $a0, my_string   # provide the string info to be printed out
    syscall             # make the system call    

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
