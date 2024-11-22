.model small
.stack 50
.data
    tb1 db 10,13,'Nhap vao so: $'
    tb2 db 10,13,'Tong cac chu so: $'
    so db  10 dup('$')
    muoi dw 10
    sum dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,so
        int 21h
       
        xor cx,cx
        xor dx,dx
        lea si,so+2
        mov cl,[so+1]
    Lap:
        mov ax,dx
        xor bx,bx
        mov bl,[si]
        sub bl,30h
        add ax,bx
        mov dx,ax
        add sum, bx
        inc si
        loop Lap
            
        ; Hiển thị tổng các chữ số
        xor cx,cx
    Lapchia:
        xor dx,dx
        div muoi
        add dx,30h
        push dx
        inc cx 
        cmp ax,0
        jne Lapchia
            
    Hienthi:
        pop dx
        mov ah,02h
        int 21h
        loop Hienthi            
       
    mov ah,4ch
    int 21h               
    main endp    
    end main
