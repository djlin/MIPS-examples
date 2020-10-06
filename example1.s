### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This program DOES NOTHING, but gives you the idea how the assembly language/program 
###     looks like and how to run it in the simulator

### -------------------------------------
### This is the data segment (data items)
### -------------------------------------
    .data

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main        # .globl declares the symbol "main" as global and 
                        # can be references from other files

main:

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
