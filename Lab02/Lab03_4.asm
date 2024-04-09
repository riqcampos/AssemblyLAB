title Soma das matrizes apresentadas
.model small
.stack 100h
.data 
    m1      db 1,2,1;declarando a matriz m1
            db 1,1,1
            db 3,2,1

    m2      db 3,4,5;declarando a matriz m2
            db 1,3,1
            db 2,4,4

    soma    db 0,0,0;declarando a matriz soma
            db 0,0,0
            db 0,0,0
        
.code
    main proc
        mov ax,@data;permitindo o acesso das variaveis em @data
        mov ds,ax
        call soma_matriz;chamando o procedimento soma
        call imprime_matriz;chamando o procedimento de impressao
        mov ah,4ch;saida do dos
        int 21h
    main endp

imprime_matriz proc
    xor bx,bx; indice da linha
    mov ch, 3; contador linha
    muda_linha:
        xor si, si;indice da coluna
        mov cl, 3; contador coluna
    imprime_linha:
        mov dl, soma[bx][si];movendo oque esta na posicao bx si na matriz para dl
        mov ah,02h;imprimindo o que esta dentro da matriz
        int 21h
        inc si;passando para o proximo item
        dec cl;reduzindo contador
        jnz imprime_linha
        mov dl, 10h;passando a impressao para a proxima linha
        mov ah,02h
        int 21h
        add bx, 3;mudando a linha
        dec ch;decrementando o contador da linha
        jnz muda_linha
    ret
imprime_matriz endp
soma_matriz proc
    xor bx,bx;indice da linha
    mov ch, 3
    passa_linha:
        xor si, si;indice da coluna
        mov cl, 3; conta coluna
    soma_caractere:
        mov ax,m1[bx][si];colocando oque esta em m1 em ax
        mov soma[bx][si],ax;movendo oque esta em ax para soma
        mov ax,m2[bx][si]; movendo oque esta em m2 para ax
        add soma[bx][si],ax;somando oque esta em ax com oque esta em soma
        inc si;passa para o proximo item
        dec cl;decrementa o contador de coluna
        jnz soma_caractere
        mov dl, 10h;imprime um enter
        mov ah,02h
        int 21h
        add bx, 3;passa para a proxima linha
        dec ch;decrementa o contador das linhas
        jnz passa_linha
    ret
soma_matriz endp
end main

