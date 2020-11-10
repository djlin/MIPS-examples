### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Objective: 
###    We want to implement the following loop using MIPS
###
###    for(int i=1; i < 6; i++) {
###       cout << i;
###    }
## Here, we're going to use branches, add, system call, move


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
		# implement your code here

# terminate the code.
    li $v0, 10
    syscall
