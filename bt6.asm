.model small
.stack 50
.data
    tb1 db 10,13,'Ket qua khi nhap mot ky tu thuong: $'
    tb2 db  ' $'
    ky_tu db ?     
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah,09h
    lea dx,tb1
    int 21h

    mov ah,01h
    int 21h
    mov ky_tu,al
        
    lap:
        mov ah,09h
        lea dx,tb2
        int 21h
        
        inc ky_tu
        cmp ky_tu,'z'
        jg Thoat
        mov ah,02h
        mov dl,ky_tu
        int 21h
        jmp lap
    
    thoat:
        mov ah, 4ch         
        int 21h

main endp
end main
