;Viết chương trình sử dụng các hàm để đọc thông tin thời gian, ngày từ hệ thống và lưu ra tệp

.model smaller 
.stack 100h
.data
    contro dw ?
    tentep db "thoigian,txt",0
    noidung db 100 dup (?)
    hour db 0
    minute db 0
    second db 0
    hour1 db 0
    minute1 db 0
    second1 db 0

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,2ch
    int 21h

    mov [hour],ch
    mov [minute],dh
    mov [second],dl

    mov al,[hour]
    mov ah,30h
    mov [hour1],ax

    mov al,[minute]
    mov ah,30h
    mov [minute1],ax

    mov al,[second]
    mov ah,30h
    mov [second1],ax

    mov ah,3ch
    lea dx, tentep
    mov cx,0
    int 21h
    mov contro,ax

    mov ah,40h
    lea bx, hour1
    mov cx,2
    mov dx,contro
    int 21h

    mov ah,40h
    lea bx, minute1
    mov cx,2
    mov dx,contro
    int 21h
    
    mov ah,40h
    lea bx, second1
    mov cx,2
    mov dx,contro
    int 21h

    mov ah,3eh
    mov bx,contro
    int 21h

    mov ah,4ch
    int 21h
main endp
end main
```

