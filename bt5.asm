.model small
.stack 100h
.data
    gm db 10,13,'Good Morning! $'
    gf db 10,13,'Good Afternoon! $'
    ge db 10,13,'Good Evening! $'
    tb db 10,13,'Hay nhap ky tu: $'
.code
    main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,tb
    int 21h
    
    mov ah,01h
    int 21h
    
    cmp al,'S'
    je Morning
    cmp al,'s'
    je Morning
    
    cmp al,'T'
    je Afternoon
    cmp al,'t'
    je Afternoon
    
    cmp al,'C'
    je Evening
    cmp al,'c'
    je Evening
    jmp Thoat
  
Morning: 
    mov ah,09h
    lea dx,gm
    int 21h
    jmp Thoat
    
Afternoon:
    mov ah,09h
    lea dx,gf
    int 21h
    jmp Thoat
            

Evening:
    mov ah,09h
    lea dx,ge
    int 21h
    jmp Thoat

Thoat:        
    mov ah,4ch
    int 21h    
main endp
end main