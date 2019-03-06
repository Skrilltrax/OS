; Infinite loop (e9 fd ff)
;loop:
;   jmp loop 

mov ah,0x0e ;tty mode
mov al,'H' ; sends H to al
int 0x10 ; Video interrupt to print H
mov al,'E'
int 0x10
mov al,'L'
int 0x10
int 0x10 ; L is already in al
mov al,'O'
int 0x10



jmp $; jmp to current address inf loop

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
dw 0xaa55 