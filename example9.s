    ### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows how to write a function call.
###
### --------------------------
### This is the data segment
### --------------------------
    .data

outputSameValue:            .asciiz  "The two values are the same."
outputDifferentValue:       .asciiz  "The two values are not the same."

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $a0, 5
    li $a1, 5

    jal compareTwoValues

# Terminate the program
termTheCode:
    li $v0, 10
    syscall

.end main

compareTwoValues:
    beq $a0, $a1, printTheSameValue
    li $v0, 4
    la $a0, outputDifferentValue
    syscall

# return to the caller
functionReturn:
    jr $ra
### end of compareTwoValues:


printTheSameValue:
    li $v0, 4
    la $a0, outputSameValue
    syscall
    j functionReturn
### end of printTheSameValue:

### End of file
