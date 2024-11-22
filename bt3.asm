.model small
.stack 50
.data
    bien db ?
    tb1 db 10,13,'Hay go 1 phim: $'
    tb2 db 10,13,'Ky tu ke truoc: $'
    tb3 db 10,13,'Ky tu ke sau: $'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,01h
        int 21h
        mov bien,al 
        
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,02h
        sub bien, 1
        mov dl,bien
        int 21h
               
        mov ah,09h
        lea dx,tb3
        int 21h       
              
        mov ah,02h
        add bien,2
        mov dl,bien
        int 21h
        
        mov ah,4ch
        int 21h
main endp
end main