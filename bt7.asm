.model small
.stack 50
.data
    chuoi db 30 dup('$')
    tb1 db 10,13,'Hay nhap chuoi ky tu vao: $'
    tb2 db 10,13,'Chuoi ky tu da nhap la: $'
    tb3 db 10,13,'So ky tu co trong chuoi: $'
    so_dem dw 0
    so_chia dw 10
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        lea si,chuoi
        Lap_doc:
            mov ah,01h
            int 21h
            cmp al,13
            je Hien_thi_lai
            mov [si],al
            inc so_dem
            inc si
            jmp Lap_doc
        Hien_thi_lai:
            mov ah,09h
            lea dx,tb2
            int 21h
            mov ah,09h
            lea dx,chuoi
            int 21h
            
        xor ax,ax
        mov ax,so_dem
        xor cx,cx
        
        Lap_chia:
            xor dx,dx
            div so_chia
            inc cx
            push dx
            cmp ax,0
            jne Lap_chia
        
        mov ah,09h
        lea dx,tb3    
        int 21h    
        
        Hien_so_ky_tu:
            pop dx
            add dx,30h
            mov ah,02h
            int 21h
            loop Hien_so_ky_tu
            
        mov ah,4ch
        int 21h
    main endp
    end main