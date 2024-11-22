.model small
.stack 50
.data
    tb1 db 10,13,'Nhap vao day so: $'
    tb2 db 10,13,'Trung binh cong: $'
    num db 50 dup('$')
    muoi dw 10
    count dw ?
    sum dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,num
        int 21h
        
        xor cx,cx
        xor dx,dx
        lea si,num+2
        mov cl,[num+1]
        Cong:
            cmp [si],13
            je Tong
            cmp [si],' '
            jne Lapnhan
            
            Tong:
                inc count
                add sum,ax
                xor dx,dx
                inc si
              
            Lapnhan:
                mov ax,dx
                xor bx,bx
                mov bl,[si]
                sub bl,30h
                mul muoi
                add ax,bx
                mov dx,ax
                inc si
            loop Cong    
            mov ax,sum            
         Chia:
            mov ax,sum
            cwd
            div count
        xor cx,cx
        Lapchia:
            xor dx,dx
            div muoi
            add dx,30h
            push dx
            inc cx
            cmp ax,0
            jne Lapchia
            
        mov ah,09h
        lea dx,tb2
        int 21h
        
        Hienthi:
            pop dx
            mov ah,02h
            int 21h
            loop Hienthi
        mov ah,4ch
        int 21h
    main endp
    end main