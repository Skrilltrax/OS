; [org 0x7c00] ; tell the assembler that our offset is bootsector code

; mov bx, HELLO_WORLD
; call print

; call print_nl

; mov bx, ME_BOOT_OKAY
; call print

; jmp $ ; jump to current address = infinite loop

; %include "utils/print.asm"

; HELLO_WORLD:
;     db 'HELLO WORLD', 0

; ME_BOOT_OKAY:
;     db 'ME BOOT OKAY', 0

; times 510 - ($-$$) db 0
; dw 0xaa55

mov ah, 0x0e ; tty

mov al, [the_secret]
int 0x10 ; we already saw this doesn't work, right?

mov bx, 0x7c0 ; remember, the segment is automatically <<4 for you
mov ds, bx
; WARNING: from now on all memory references will be offset by 'ds' implicitly
mov al, [the_secret]
int 0x10

mov al, [es:the_secret]
int 0x10 ; doesn't look right... isn't 'es' currently 0x000?

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10


jmp $

the_secret:
    db "X"

times 510 - ($-$$) db 0
dw 0xaa55
