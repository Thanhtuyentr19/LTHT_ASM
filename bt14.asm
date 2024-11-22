.model small
.stack 50
.data
    tb1 db 10,13,'Nhap so thu nhat: $'
    tb2 db 10,13,'Nhap so thu hai: $'
    tb3 db 10,13,'Tong 2 so la: $'
    tb4 db 10,13,'Hieu 2 so la: $'
    muoi dw 10
    s1 dw 0
    s2 dw 0
    so1 db 50 dup('$')
    so2 db 50 dup('$')
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,so1
        int 21h
        
        xor cx,cx
        xor dx,dx
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
        
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,0Ah
        lea dx,so2
        int 21h
        
        xor cx,cx
        xor dx,dx
        lea si,so2+2
        mov cl,[so2+1]
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
        
        mov ah,09h
        lea dx,tb3
        int 21h
        
        mov ax,s1
        add ax,s2
       
        xor cx,cx
        Lapchia1:
            xor dx,dx
            div muoi
            push dx
            inc cx
            cmp ax,0
            jne Lapchia1
        Hienthi1:
            pop dx
            add dx,30h
            mov ah,02h
            int 21h
            loop Hienthi1
        
        mov ah,09h
        lea dx,tb4
        int 21h
            
        mov ax,s1
        sub ax,s2
        
        xor cx,cx
        Lapchia2:
            xor dx,dx
            div muoi
            push dx
            inc cx
            cmp ax,0
            jne Lapchia2
        Hienthi2:
            pop dx
            add dx,30h
            mov ah,02h
            int 21h
            loop Hienthi2
        
        mov ah,4ch
        int 21h
    main endp
    end main
