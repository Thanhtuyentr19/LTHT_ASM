.model small
.stack 50
.data
    tem DB ?
    tb1 DB 10,13,'Hay go 1 phim: $'
    tb2 DB 10,13,'Ky tu nhan duoc la: $'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,07h
        int 21h  
        
        mov tem,al
        
        mov ah,02h
        mov dl,tem
        int 21h
        
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,02h
        mov dl,tem
        int 21h
        
        mov ah,4ch
        int 21h
        
        main endp
end main
