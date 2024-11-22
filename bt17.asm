.model small
.stack 100
.data
    mang db 20,0, 20 dup(?)  
    tb2 db 10,13,'Chuoi da duoc dao nguoc: $' 
    tb1 db "Nhap 1 chuoi vao: $"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx, tb1
        int 21h
        
        mov ah,0ah
        lea dx,mang
        int 21h
        
        lea dx, tb2
        mov ah,9
        int 21h
        
        ; Tính độ dài của chuỗi
        mov cl,[mang + 1]
        
        ; Đưa con trỏ về cuối chuỗi
        lea si, mang + 2
        add si, cx
        
        ; In chuỗi theo thứ tự ngược
        Lap:
            dec si
            mov dl, [si]
            mov ah, 02h
            int 21h
            loop Lap
            
        mov ah,4ch
        int 21h
    main endp
    end main
