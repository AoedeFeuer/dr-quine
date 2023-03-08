global  _main
extern _printf
; Quine is a self-replicating program.
section .text
_main:
    jmp show
    ret
show:
    push rbp
    lea rdi, [rel program] ; when accessing named variables, a rel prefix is required, use lea to get your addresses
    lea rsi, [rel program]
    mov rdx, 34
    mov rcx, 10
    mov rax, 0
    call _printf
    mov rax, 0
    pop rbp
    ret

section .data
program:
    db "global  _main%3$cextern _printf%3$c; Quine is a self-replicating program.%3$csection .text%3$c_main:%3$c    jmp show%3$c    ret%3$cshow:%3$c    push rbp%3$c    lea rdi, [rel program] ; when accessing named variables, a rel prefix is required, use lea to get your addresses%3$c    lea rsi, [rel program]%3$c    mov rdx, 34%3$c    mov rcx, 10%3$c    mov rax, 0%3$c    call _printf%3$c    mov rax, 0%3$c    pop rbp%3$c    ret%3$c%3$csection .data%3$cprogram:%3$c    db %2$c%1$s%2$c, 0%3$c", 0
