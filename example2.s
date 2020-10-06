### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This program DOES NOTHING, again! But you can learn how to declare data in the
###     data segment

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

    # Terminate the program
    li $v0, 10
    syscall

.end main
### End of file
