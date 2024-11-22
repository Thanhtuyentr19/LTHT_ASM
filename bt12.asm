.model small
.stack 50
.data
    tb1 db 10,13,'Nhap ky tu: $'
    tb2 db 10,13,'Ma ascii dang Hex: $' 
    tb3 db 10,13,'Ma ascii dang Dec: $'
    tb4 db 10,13,'Ma ascii dang Bin: $'
    muoi dw 10
    so db 0
    chia16 dw 16
    chia2 dw 2   
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,01h
        int 21h
        mov so,al
        
        ; In mã ASCII dạng Hex
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ax, 0
        mov al, so
        xor cx, cx
        Lap1:
            xor dx, dx
            div chia16
            cmp dx, 9
            ja Chucai
            add dx, 30h
            jmp Chuso
            Chucai:
            add dx, 37h ; Chữ A đến F (Hex)
            Chuso:
            push dx
            inc cx
            xor ah, ah
            cmp ax, 0
            jne Lap1
        Hienthi:
            pop dx
            mov ah, 02h
            int 21h
            loop Hienthi
            mov dx, 'h'
            mov ah, 02h
            int 21h

        ; In mã ASCII dạng Dec
        mov ah, 09h
        lea dx, tb3
        int 21h
        
        xor ah, ah
        mov al, so
        xor cx, cx
        Lapchia:
            xor dx, dx
            div muoi
            push dx
            inc cx
            cmp al, 0
            jne Lapchia
        Hienthi2:
            pop dx
            add dx, 30h
            mov ah, 02h
            int 21h
            loop Hienthi2

        ; In mã ASCII dạng Bin
        mov ah, 09h
        lea dx, tb4
        int 21h
        
        xor ax, ax
        mov al, so
        xor cx, cx
        Lap2:
            xor dx, dx
            div chia2
            push dx
            inc cx
            cmp ax, 0
            jne Lap2
        Hienthi3:
            pop dx
            add dx, 30h
            mov ah, 02h
            int 21h
            loop Hienthi3
    
        mov dl, 'b'
        mov ah, 02h
        int 21h    
        
        mov ah, 4ch
        int 21h      
    main endp
    end main
