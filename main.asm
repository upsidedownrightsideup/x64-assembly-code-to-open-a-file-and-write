section .data
    filename db 'test.txt',0
    message db 'Hello, Planet',10,0

section .text
    global _start

_start:
    ; Open file
    mov rax, 2           ; system call number for 'open'
    mov rdi, filename    ; pointer to filename string
    mov rsi, 0           ; flags (O_RDONLY = 0)
    mov rdx, 0           ; mode (not used)
    syscall              ; call the kernel to open the file
    mov r8, rax          ; save the file descriptor in r8

    ; Write to file
    mov rax, 1           ; system call number for 'write'
    mov rdi, r8          ; file descriptor
    mov rsi, message     ; pointer to message string
    mov rdx, 14          ; message length
    syscall              ; call the kernel to write to the file

    ; Close file
    mov rax, 3           ; system call number for 'close'
    mov rdi, r8          ; file descriptor
    syscall              ; call the kernel to close the file

    ; Exit program
    mov rax, 60          ; system call number for 'exit'
    xor rdi, rdi         ; exit status (0 = success)
    syscall              ; call the kernel to exit
