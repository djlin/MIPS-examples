### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     In this lab, we'll implemeent the power function
###         power(x, y) = x^y
###         power(2, 3) = 2^3 = 8
###     For simplicity, we assume that both x and y are > 1.
###			x is the base, and y is the power term.
###
### --------------------------
### This is the data segment
### --------------------------
    .data

prompt:         .asciiz  "Please enter the first integer:\n"
prompt2:        .asciiz  "Please enter the second integer:\n"
newline:        .asciiz  "\n"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    # prompt to enter the first integer
    li $v0, 4
    la $a0, prompt
    syscall

    # read the first integer and store it in @a0
    li $v0, 5
    syscall
    move $t0, $v0

    # [ implemeent your code here ]

    # call the power function
    jal power

# Terminate the program
    li $v0, 10
    syscall

.end main

power:
    # [ implement the power function here ]


    # return to the function caller
    jr $ra

### End of file
