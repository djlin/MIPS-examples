### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows how to read an integer from keyboard and print it out

### --------------------------
### This is the data segment
### --------------------------
    .data

wordWithNumber:         .word   1, 2        # 32-bit number(s)
halfNumber:             .half   3, 4        # 16-bit number(s)
byteNumber:             .byte   5           # 8-bit 

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $v0, 5
    syscall

    move $a0, $v0
    li $v0, 1
    syscall

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
