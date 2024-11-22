.model small
.stack 100h
.data
    tb1 db 10,13,'Nhap ten cua ban: $'
    tb2 db 10,13,'Xin chao $'
    ten db 50 DUP('$')
.code
    main proc
        mov ax, @data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,ten
        int 21h
        
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,09h
        lea dx, ten+2
        int 21h
        
        mov ah,4ch
        int 21h
main endp
end main
        
        