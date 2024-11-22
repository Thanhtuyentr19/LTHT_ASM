.model small
.stack 50
.data
    tb1 db 10,13,'A: $'
    tb2 db 10,13,'B: $'
    tb3 db 10,13,'A/B= $'
    tb4 db 10,13,'A*B= $'
    A db 10 dup('$')
    B db 10 dup('$')
    so_A dw 0
    so_B dw 0
    muoi dw 10 
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        ; Nhập số A
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,A
        int 21h 
        
        xor cx,cx
        xor dx,dx
        lea si,A+2
        mov cl,[A+1]
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
        mov so_A,dx
            
        ; Nhập số B
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,0Ah
        lea dx,B
        int 21h
        
        xor cx,cx
        xor dx,dx
        lea si,B+2
        mov cl,[B+1]
        Lapnhan2:
            mov ax,dx
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            add ax,bx
            mov dx,ax
            inc si
            loop Lapnhan2
        mov so_B,dx
        
        ; Tính A/B
        mov ah,09h
        lea dx,tb3
        int 21h
        
        mov ax, so_A
        mov bx, so_B
        xor cx, cx
        xor dx, dx
        Chia:
            sub ax, bx
            inc cx
            cmp ax, bx
            jae Chia
        mov ax, cx
        xor cx, cx
        Lapchia1:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne Lapchia1
        Hienthi1:
            pop dx
            mov ah, 02h
            int 21h
            loop Hienthi1
        
        ; Tính A*B
        mov ah,09h
        lea dx,tb4
        int 21h
        
        xor cx,cx
        xor dx,dx
        mov cx, so_B
        Nhan:
            add dx, so_A
            loop Nhan
        mov ax, dx
        xor cx, cx
        Lapchia2:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne Lapchia2
        Hienthi2:
            pop dx
            mov ah, 02h
            int 21h
            loop Hienthi2
            
        mov ah,4ch
        int 21h    
    main endp
    end main
