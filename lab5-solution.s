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

    # read the first integer and store it in $t0
    li $v0, 5
    syscall
    move $t0, $v0

    # prompt to enter the second integer
    li $v0, 4
    la $a0, prompt2
    syscall

    # read the second integer and store it in $t1
    li $v0, 5
    syscall
    move $t1, $v0

		# Note: the reason why I use $t0 and $t1 instead of
		#			$a0 and $a1 is because the system call above
		#			will overwrite the content of $a0
	
    # provide parameters for the function call
		#		function calls can carry parameters from $a0~$a3
    # use $a0 for result
    # use $a1 for the base
    # use $a2 for the power term (loop control)
    move $a0, $t0
    move $a1, $t0
    move $a2, $t1  

    # run the power function
    jal power

# Terminate the program
    li $v0, 10
    syscall

.end main

power:

    # implement the power function here
    mul $a0, $a0, $a1

    # print out the temporary results (for debugging/final results)
    li $v0, 1
    syscall

    # keep the multiplication result in $a0, or it will be overwritten
    move $t0, $a0

    # separate the outputs
    li $v0, 4
    la $a0, newline
    syscall

    # restore the result to $a0
    move $a0, $t0

    # check if we should continue the loop
    sub $a2, $a2, 1
    bne $a2, 1, power

    # return to the function caller
    jr $ra

### End of file
