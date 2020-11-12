### Source: https://www.eecis.udel.edu/~davis/cpeg222/AssemblyTutorial/Chapter-27/ass27_1.html
### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     In this lab, we'll learn how to call a subroutine inside of a subroutine
###      (consecutive function calls)
###
### Example:
###     step 1: In main() -> call function1()
###     step 2: In function1() -> call function2()
###     step 3: return to function1()
###     step 4: return to main()
###
### --------------------------
### This is the data segment
### --------------------------
.data

stringInMain:       .asciiz     "In main()\n"
stringInFunction1:  .asciiz     "In function1()\n"
stringInFunction2:  .asciiz     "In function2()\n"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------

.text 
.globl main

main:
    li $a0, 1
    li $a1, 2
    jal function1

    la $a0, stringInMain
    li $v0, 4
    syscall

# ----
# Done, terrminate the program

    li $v0, 10
    syscall

.end main

function1:
    mul $a0, $a0, 2
    mul $a1, $a1, 2
    jal function2

    la $a0, stringInFunction1
    li $v0, 4
    syscall

    jr $ra

function2:
    mul $a0, $a0, 2
    mul $a1, $a1, 2

    la $a0, stringInFunction2
    li $v0, 4
    syscall

    jr $ra