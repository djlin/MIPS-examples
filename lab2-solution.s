### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This lab will print your name and the date (1008) in two lines

### --------------------------
### This is the data segment
### --------------------------
    .data

myName:  .asciiz     "Tachun Lin\n"
date:       .word       1008

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $v0, 4           # system call #4 => print a message
    la $a0, myName      # provide the string info to be printed out
    syscall             # make the system call    

    li $v0, 1
    lw $a0, date
    syscall

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
