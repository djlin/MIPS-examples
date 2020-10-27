### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This lab uses several operations, including branches, add, load, system call
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
    li $t0, 6                   # the final value
    li $t1, 1                   # my counter

loop:
    bne $t0, $t1, printAndIncrement
    j termTheCode
.end main

printAndIncrement:
    li $v0, 1
    move $a0, $t1
    syscall
    add $t1, $t1, 1
    j loop

# Terminate the program
termTheCode:
    li $v0, 10
    syscall


### End of file
