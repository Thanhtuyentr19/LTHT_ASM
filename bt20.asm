.model small
.stack 50
.data
    tb1 db 10,13,'Nhap so: $'
    tb2 db 10,13,'So hoan hao $'
    tb3 db 10,13,'Khong so hoan hao $'
    mang db 50 dup('$')
    muoi dw 10
    s1 dw 0
    s2 dw 0
    s3 dw 0
    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,mang
        int 21h
        xor cx,cx
        xor dx,dx
        lea si,mang+2
        mov cl,[mang+1]
        Lapnhan:
            mov ax,dx
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov dx,ax
            inc si
            loop Lapnhan
        
        mov s1,dx   
        mov ax,s1
        mov bx,2
        cwd
        div bx
        mov s3, ax
        
        mov cx,1
        Tong:
        xor dx,dx
        mov ax,s1
        cmp s2,ax
        jae Thoat
        div cx
        cmp dx,0
        jne Boqua
        add s2,cx
        Boqua:
        inc cx
        cmp cx,s3
        jle Tong
        
        Thoat:
        mov bx,s1
        cmp bx,s2
        je HH
        lea dx,tb3
        jmp inra
        HH:
        lea dx,tb2
        inra:
        mov ah,09h
        int 21h
        
   
     
            
        mov ah,4ch
        int 21h
           
    main endp
    end main