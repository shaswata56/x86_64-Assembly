global _start
section .data
        addr db "yellow", 0x0a
        len equ $ - addr
section .text
_start:
        mov [addr], byte 'H'
        mov [addr+5], byte '!'
        mov eax, 4      ; sys-write system call
        mov ebx, 1      ; stdout file descriptor
        mov ecx, addr   ; bytes to write
        mov edx, len    ; number of byte to write
        int 0x80        ; perform system call
        mov eax, 1      ; sys_exit system call
        mov ebx, 0      ; exit status is 0
        int 0x80        ; nasm -f elf32 ex2.asm -o ex2.o ; ld -m elf_i386 ex2.o -o ex2
