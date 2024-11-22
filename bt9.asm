.model small
.stack 50
.data
    tb1 db 10,13,'Nhap so thu nhat: $'
    tb2 db 10,13,'Nhap so thu hai: $'
    tb3 db 10,13,'Tong cua 2 so la: $'
    so_1 db 10 dup('$')
    so_2 db 10 dup('$')
    so1 dw 0
    so2 dw 0
    muoi dw 10
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        ; Nhập số thứ nhất
        mov ah,09h
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,so_1
        int 21h
   
        ; Chuyển chuỗi số thứ nhất thành số N1
        xor cx, cx
        xor dx, dx
        lea si, so_1+2
        mov cl, [so_1+1]
        Lapnhan1:
            mov ax, dx
            xor bx, bx
            mov bl, [si]
            sub bl, '0'
            mul muoi
            add ax, bx
            mov dx, ax
            inc si
            loop Lapnhan1
         
        mov so1, dx
       
        ; Nhập số thứ hai
        mov ah,09h
        lea dx,tb2
        int 21h
        
        mov ah,0Ah
        lea dx,so_2
        int 21h

        ; Chuyển chuỗi số thứ hai thành số N2
        xor cx, cx
        xor dx, dx
        lea si, so_2+2
        mov cl, [so_2+1]
        Lapnhan2:
            mov ax, dx
            xor bx, bx
            mov bl, [si]
            sub bl, '0'
            mul muoi
            add ax, bx
            mov dx, ax
            inc si
            loop Lapnhan2
            
        mov so2, dx
        
        ; In tổng của hai số
        mov ah,09h
        lea dx,tb3
        int 21h
        
        mov dx, so2
        add dx, so1
       
        mov ax, dx
        xor cx, cx
        Lapchia:
            xor dx, dx
            div muoi
            add dl, '0'
            push dx
            inc cx
            cmp ax, 0
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
