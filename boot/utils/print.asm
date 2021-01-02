print:
    pusha ; Save contents of ax
    jmp loop

print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10
    jmp done

loop:
    mov al, [bx] ; Move content stored at bx location to al
    cmp al, 0 ; compare al to \0
    je done

    mov ah, 0x0e    ; tell video interrupt that we want to print data
    int 0x10        ; Video interrupt

    add bx, 1
    jmp loop

done:
    popa
    ret