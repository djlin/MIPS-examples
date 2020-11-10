### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows different addressing modes.
###
### Important concept:
###			Addressing modee is "how an address (memory or register) is determined.
###
### --------------------------
### This is the data segment
### --------------------------
    .data

helloString:    .asciiz     "Hello, World!"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    # the value "3" is immediate addressing
    #   (operand = A, A is the content of the address field)
    #   => NO memory reference
    li $t1, 3

    # direct addressing, one memory reference
    # access the content at address 0x10010000
	# Note: since we cannot have the 32-bit address in a
	#		32-bit long instruction, we need translations
	# ** Advanced note **
	#     0x10010000 is translated into (0x1001 << 16)
    #     through "lui $1, 4097", and then stored in $1 
    lw $t2, 0x10010000

    # register addressing
    #   operand is in a register
    #   No memory reference
    add $t0, $t1, $t2

    # register indirect addressing
    #   use (addr), CPU reads the address stored in addr 
    #   and go to that address to access the value located there
    la $t0, helloString
    lw $s1, ($t0)

    # displacement addresssing
    #   effective address with offset
    # since $t0 has 32 bits, to get the next word from $t0, 
    # add 4 (bytes) to it
    lw $s2, 4($t0)
    # this is equivalent to
    add $t0, $t0, 4
    lw $s3, ($t0)

    # Note:
    #   observe $s1 and $s2 after the above instructions 
    #   (check the data segment tab)

    # relative addreessing (PC relative)
    #   here, the "haveSameValue" is used to calculate the offset
    #   [haveSameValue - address of the beq instruction]
    beq $t0, $t0, haveSameValue

stackAddressing:
    # stack addressing
    #   push a word to the stack using the stack pointer $sp
    subu $sp, $sp, 4
    lw $t0, helloString
    sw $t0, ($sp)

    # pop the content from the top of the stack
    lw $t1, ($sp)
    addu $sp, $sp, 4

# Terminate the program
termTheCode:
    li $v0, 10
    syscall

.end main


haveSameValue:
    nop
    j stackAddressing

### End of file
