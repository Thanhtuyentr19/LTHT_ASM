.model small
.stack 50
.data
    tb1 db 10,13,'Nhap so thu nhat: $'
    tb2 db 10,13,'Nhap so thu hai: $'
    tb3 db 10,13,'Uoc so chung lon nhat: $'
    muoi dw 10
    s1 dw 0
    s2 dw 0
    so1 db 10 dup('$')
    so2 dw 0
    so db 10 dup('$')
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        ; Nhap so thu nhat
        mov ah,09h
        lea dx,tb1
        int 21h
        xor cx,cx
        mov ah,0Ah
        lea dx,so1
        int 21h
        
        ; Chuyen so thu nhat sang so nguyen
        xor dx,dx
        xor cx,cx
        lea si,so1+2
        mov cl,[so1+1]
        Lapnhan1:
            mov ax,dx
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov dx,ax
            inc si
            loop Lapnhan1
        mov s1,dx
        
        ; Nhap so thu hai
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,0Ah
        lea dx,so
        int 21h
        
        ; Chuyen so thu hai sang so nguyen
        xor dx,dx
        xor cx,cx
        lea si,so+2
        mov cl,[so+1]
        Lapnhan2:
            mov ax,dx
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov dx,ax
            inc si
            loop Lapnhan2
        mov s2,dx
        
        ; Tinh uoc so chung lon nhat
        mov ah,09h
        lea dx,tb3
        int 21h
        
        mov bx,s1
        mov dx,s2 
        
        Lap:
        cmp bx,dx
        jz Thoat
        ja Lon
        jb Nho
        Lon:
            mov ax,bx
            sub ax,dx
            mov bx,ax
            jmp Lap
        Nho: 
            mov ax,dx
            sub ax,bx
            mov dx,ax
            jmp Lap
        Thoat: 
                    
        mov ax,bx
        xor cx,cx 
        Lapchia:
            xor dx,dx
            div muoi
            push dx
            inc cx
            cmp ax,0
            jne Lapchia
        Hienthi:
            pop dx
            add dx,30h
            mov ah,02h
            int 21h
            loop Hienthi
        mov ah,4ch
        int 21h
    main endp
    end main
