section .data
    filename db "time_info.txt",0

section .bss
    time_buffer resb 32 ; Buffer để lưu thông tin thời gian

section .text
    global _start

_start:
    ; Gọi hàm để lấy thông tin thời gian và ngày
    mov eax, 0      ; syscall number cho sys_time
    mov ebx, time_buffer  ; con trỏ đến vùng nhớ để lưu thông tin thời gian
    int 0x80        ; Gọi kernel

    ; Ghi thông tin vào tệp
    mov eax, 5      ; syscall number cho sys_open
    mov ebx, filename ; con trỏ đến tên tệp
    mov ecx, 641     ; cờ cho O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0666    ; quyền truy cập
    int 0x80         ; Gọi kernel

    ; Kiểm tra xem có lỗi khi mở tệp không
    cmp eax, 0
    jl  error_open

    ; Ghi thông tin vào tệp
    mov eax, 4      ; syscall number cho sys_write
    mov ebx, eax    ; file descriptor của tệp đã mở
    mov ecx, time_buffer ; con trỏ đến thông tin thời gian
    mov edx, 32     ; độ dài dữ liệu để ghi
    int 0x80        ; Gọi kernel

    ; Đóng tệp
    mov eax, 6      ; syscall number cho sys_close
    mov ebx, 1      ; file descriptor của tệp đã mở
    int 0x80        ; Gọi kernel

    ; Kết thúc chương trình
    mov eax, 1      ; syscall number cho sys_exit
    xor ebx, ebx    ; status 0
    int 0x80
