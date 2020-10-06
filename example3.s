### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This program demonstrates how different "load" instructions work

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

    li $t0, 123             # load number 123 into $t0
                            # Note: you'll find that 'li' is translated to 'ori'
                            #   because 'li' is a "pseudo instruction"

    la $t1, wordWithNumber  # load address of wordWithNumber into $t1
                            # Note: you'll find that 'la' is translated to 'lui'
                            #   because 'la' is a "pseudo instruction"

    lw $t2, 4($t1)          # load word 4(value) into $t2
                            #   => here, the value is 456 (2nd in wordWithNumber)

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
