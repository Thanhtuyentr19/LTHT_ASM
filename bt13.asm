.model small
.stack 50
.data
    tb1 db 10,13,'Nhap so thu nhat theo he Hex: $'
    tb2 db 10,13,'Nhap so thu hai theo he Hex: $'
    tb3 db 10,13,'A + B = $'
    tb4 db 10,13,'A - B = $'
    tb5 db 10,13,'A and B = $'
    tb6 db 10,13,'A or B = $'
    muoisau dw 16
    so1 dw 0
    mang1 db 10 dup('$')
    so2 dw 0
    mang2 db 10 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax

        ; Nhập số thập lục phân A
        mov ah, 09h
        lea dx, tb1
        int 21h

        mov ah, 0Ah
        lea dx, mang1
        int 21h

        xor cx, cx
        xor dx, dx
        lea si, mang1 + 2
        mov cl, [mang1 + 1]
        Lap1:
            mov ax, dx
            xor bx, bx
            mov bl, [si]
            cmp bl, 57
            ja Chucai
            sub bl, 30h
            jmp Nhan
            Chucai:
            sub bl, 37h ; Chữ A đến F (Hex)
            Nhan:
            mul muoisau
            add ax, bx
            mov dx, ax
            inc si
            loop Lap1
        mov so1, dx

        ; Nhập số thập lục phân B
        mov ah, 09h
        lea dx, tb2
        int 21h

        mov ah, 0Ah
        lea dx, mang2
        int 21h

        xor cx, cx
        xor dx, dx
        lea si, mang2 + 2
        mov cl, [mang2 + 1]
        Lap2:
            mov ax, dx
            xor bx, bx
            mov bl, [si]
            cmp bl, 57
            ja Chucai2
            sub bl, 30h
            jmp Nhan2
            Chucai2:
            sub bl, 37h ; Chữ A đến F (Hex)
            Nhan2:
            mul muoisau
            add ax, bx
            mov dx, ax
            inc si
            loop Lap2
        mov so2, dx

        ; In A + B
        mov ah, 09h
        lea dx, tb3
        int 21h

        mov ax, so1
        add ax, so2
        mov bx, ax
        mov cx, 16
        Lap_tong:
            mov dx, 30h
            shl bx, 1
            adc dx, 0
            mov ah, 02h
            int 21h
            loop Lap_tong

        ; In A - B
        mov ah, 09h
        lea dx, tb4
        int 21h

        mov ax, so1
        sub ax, so2
        mov bx, ax
        mov cx, 16
        Lap_tru:
            mov dx, 30h
            shl bx, 1
            adc dx, 0
            mov ah, 02h
            int 21h
            loop Lap_tru

        ; In A and B
        mov ah, 09h
        lea dx, tb5
        int 21h

        mov ax, so1
        and ax, so2
        mov bx, ax
        mov cx, 16
        Lap_and:
            mov dx, 30h
            shl bx, 1
            adc dx, 0
            mov ah, 02h
            int 21h
            loop Lap_and

        ; In A or B
        mov ah, 09h
        lea dx, tb6
        int 21h

        mov ax, so1
        or ax, so2
        mov bx, ax
        mov cx, 16
        Lap_or:
            mov dx, 30h
            shl bx, 1
            adc dx, 0
            mov ah, 02h
            int 21h
            loop Lap_or

        mov ah, 4ch
        int 21h
    main endp
    end main
