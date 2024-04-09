TITLE Inversor de vetor dentro de O(1)
.model small
.stack 100h
.data
    vetor DB 0,0,0,0,0,0,0 ;iniciando o vetor de 7 posicoes
    tamanho equ ($-vetor) ;atribuindo o tamanho do vetor dentro de uma variavel
.code
    main proc
        mov ax, @data
        mov ds, ax ;permitindo o acesso as variaveis em data
        lea bx, vetor ;apontando para a primeira posicao do vetor
        mov cx, tamanho ;iniciando o contador para o tamanho do vetor
        call read_array ;chamando procedimento para ler os valores do array
        lea bx, vetor ;pegando a primeira posicao do vetor 
        lea si, vetor ;pegando a primeira posicao do vetor 
        add si, tamanho ;levando o ponteiro ate a ultima posicao do vetor
        call reversor ;chamando procedimento inversor
        lea bx, vetor
        mov cx, tamanho
        call print_array
        mov ah,4ch
        int 21h
    main endp

;procedimento para ler o vetor
read_array proc
    READ:
        mov ah, 01h;funcao int 21 para ler o buffer
        int 21h
        sub al, "0";transformando em numero
        mov vetor[bx], al;atribindo o que foi lido a posicao do vetor
        inc bx;incrementando a posicao do vetor 
        loop READ
        ret
read_array endp
;procedimento para inverter o array
reversor proc
    return:
        mov al,vetor[bx];jogando oque esta na posicao do vetor para um registrador auxiliar
        xchg al,vetor[si];exchange entre posicao da ultima posicao do vetor e o que esta em al
        mov vetor[bx],al; jogando oque esta em al para a posicao do vetor
        inc bx;incrementa a posicao do vetor
        dec si;decrementa o ponteiro da ultima posicao 
        cmp bx, si; compara bx e si
        jle return; volta se bx maior que si
        ret
reversor endp
;procedimento para imprimir o array
print_array proc

    IMPRIME:
       
        mov dl, vetor[bx]; movendo o que esta na posicao do vetor para dl
        or dl, 30h ;transformando em caractere
        mov ah,02h;funcao para printar
        int 21h
        inc bx;incrementando posicao do vetor
        loop IMPRIME
        ret
print_array endp

end main



