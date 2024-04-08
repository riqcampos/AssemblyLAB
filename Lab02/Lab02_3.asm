TITLE Inversor de vetor dentro de O(1)
.model small
.stack 100h
.data
    vetor DB 0,0,0,0,0,0,0
    tamanho equ ($-vetor)
.code
    main proc
        mov ax, @data
        mov ds, ax
        lea bx, vetor
        mov cx, tamanho
        call read_array
        lea bx, vetor
        lea si, vetor
        add si, tamanho
        call reversor
        lea bx, vetor
        mov cx, tamanho
        call print_array
        mov ah,4ch
        int 21h
    main endp

;procedimento para ler o vetor
read_array proc
    READ:
        mov ah, 01h
        int 21h
        sub al, "0"
        inc bx
        mov vetor[bx], al
        loop READ
        ret
read_array endp
;procedimento para inverter o array
reversor proc
    return:
        mov al,vetor[bx]
        xchg al,vetor[si]
        mov vetor[bx],al
        inc bx
        dec si
        cmp BX, Si
        jle return
        ret
reversor endp
;procedimento para imprimir o array
print_array proc

    IMPRIME:
       
        mov dl, vetor[bx]
        or dl, 30h 
        mov ah,02h
        int 21h
        inc bx
        loop IMPRIME
        ret
print_array endp

end main



