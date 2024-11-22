.model small
.stack 50
.data
    muoi dw 10
    tb1 db 10,13,'Nhap so n: $'
    tb2 db 10,13,'Ket qua cua n!: $'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        xor cx,cx
        mov cl,al
        
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ax,1
        mov bx,1
        Giai_thua:
            mul bx
            inc bx
            cmp bl,cl
            jle Giai_thua
       
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
