    ### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows how run the branch operations (bne version)
###
### --------------------------
### This is the data segment
### --------------------------
    .data

notEqualString:         .asciiz  "5 != 3"
isEqualString:          .asciiz  "5 = 3"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $t0, 5
    li $t1, 3

    bne $t0, $t1, notEqual

    li $v0, 4
    la $a0, isEqualString
    syscall

# Terminate the program
termTheCode:
    li $v0, 10
    syscall

.end main

notEqual:
    li $v0, 4
    la $a0, notEqualString
    syscall
    j termTheCode

### End of file
