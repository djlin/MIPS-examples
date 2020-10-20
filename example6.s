### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows some problems in load operations. 
###     Learn how to fix them!!

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
    la $t1, $my_string          # take the (beginning) address of the string

    lb $a0, ($t1)               # print out the ASCII code of the fifth character
                                # in the string ('o') -> 111
    li $v0, 1
    syscall

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
