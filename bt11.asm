.model small
.stack 50
.data
    muoi dw 10
    s1 dw 0
    s2 dw 0
    tb1 db 10,13,'Nhap so nhi phan A: $'
    tb2 db 10,13,'Nhap so nhi phan B: $'
    tb3 db 10,13,'A + B = $'
    tb4 db 10,13,'A - B = $'
    tb5 db 10,13,'A and B = $'
    tb6 db 10,13,'A or B = $'
.code
    main proc    
        mov ax,@data
        mov ds,ax
        ;Nhap A
        mov bx,0
        mov cx,16
        mov ah,09h
        lea dx,tb1
        int 21h
        Lap1:
            mov ah,01h
            int 21h
            sub al,30h
            shl bx,1
            add bl,al
            loop Lap1
        mov s1,bx
        ;Nhap B
        mov bx,0
        mov cx,16
        mov ah,09h
        lea dx,tb2
        int 21h
        Lap2:
            mov ah,01h
            int 21h
            sub al,30h
            shl bx,1
            add bl,al
            loop Lap2
        mov s2,bx
        ;A+B
        mov ah,09h
        lea dx,tb3
        int 21h
        
        mov bx,s2
        add bx,s1
        
        mov cx,16
        Lap3:
            mov dx,30h
            shl bx,1
            adc dx,0
            mov ah,02h
            int 21h
            loop Lap3
        ;A-B
        mov ah,09h
        lea dx,tb4
        int 21h
        
        mov bx,s1
        sub bx,s2
        
        mov cx,16
        Lap4:
            mov dx,30h
            shl bx,1
            adc dx,0
            mov ah,02h
            int 21h
            loop Lap4
        ;A and B
        mov ah,09h
        lea dx,tb5
        int 21h
        
        mov bx,s1
        and bx,s2
        
        mov cx,16
        Lap5:
            mov dx,30h
            shl bx,1
            adc dx,0
            mov ah,02h
            int 21h
            loop Lap5
        ;A or B
        mov ah,09h
        lea dx,tb6
        int 21h
        
        mov bx,s1
        or bx,s2
        
        mov cx,16
        Lap6:
            mov dx,30h
            shl bx,1
            adc dx,0
            mov ah,02h
            int 21h
            loop Lap6
             
        mov ah,4ch
        int 21h
    main endp
    end main