### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This program demonstrates different addressing modes

### --------------------------
### This is the data segment
### --------------------------
    .data

wordWithNumber:         .word   123, 456        # 32-bit number(s)
halfNumber:             .half   33, 22          # 16-bit number(s)
byteNumber:             .byte   7               # 8-bit 
asciiString:            .ascii  "Hello,"        # string (NOT null terminated)
asciiStringWithNull:    .asciiz " World!"       # string (Null terminated)
floatNumber:            .float  1.25, 2.5, 3.75 # single precision floating point number(s)
doubleNumber:           .double 1.0, 2.0, 3.5   # double precision floating point number(s)
spaceReserved:          .space  100             # 100 bytes of space
# align 2                                       # alignment (not discussed here)

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    # The different "load" instructions

    # immediate addressing
    #   "actual value" is one of the operands, here: 123
    # Note: again, the assembler here translates "li" to "ori"
    li $t0, 123

    # direct addressing
    #   register/memory "location" contains the actual values
    # Note: again, the assembler here translates the following to two instructions ("lui" and "lw")
    lw $t1, wordWithNumber

    # indirect addressing
    #   use () to denote an indirect memory access. here, ($t2)
    #   CPU reads the provided address and go to that address to access the value inside
    # Note: here, the assembler translates "la" to two instructions ("lui" and "ori")
    la $t2, halfNumber
    lw $s1, ($t2)

    # register addressing
    add $t3, $t1, $t2

    # register indirect addressing
    #   NOT on MIPS!!!!
    #   Just for your information
    # lw $8, (($9))

    # displacement addressing
    #   only for load/store on MIPS
    lw $16, 4($8)

    # (pc) relative addressing
    beq $0, $3, Label

    # stack addressing

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
