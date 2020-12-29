mov ah, 0x0e ; Tells video interrupt that we want to write contents of al to TTY
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' is still available on al
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'L'
int 0x10
mov al, 'o'
int 0x10
mov al, 'a'
int 0x10
mov al, 'd'
int 0x10
mov al, 'e'
int 0x10
mov al, 'r'
int 0x10

jmp $ ; jump to current address = infinite loop

times 510-($-$$) db 0

dw 0xaa55
