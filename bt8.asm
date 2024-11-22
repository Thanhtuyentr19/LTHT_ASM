.model small
.stack 50
.data
    mang db 50,0,50 dup('$')
    thuong db 10,13, '$'
    hoa db '-$'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,0Ah
        lea dx,mang
        int 21h
        
        mov ah,09h
        lea dx,thuong
        int 21h
        
        lea si,mang+2
        mov cl,[mang+1]
        
        Lap1:
            mov al,[si]
            cmp al,'A'
            jl Boqua
            cmp al,'Z'
            ja Boqua
            add al,32
            mov [si],al
        Boqua:
            inc si
            loop Lap1  
            
        call Xuat
        
        mov ah,09h
        lea dx,hoa
        int 21h
        
        lea si,mang+2
        mov cl,[mang+1]
        Lap2:
            mov al,[si]
            cmp al,'a'
            jl Boqua2
            cmp al,'z'
            ja Boqua2
            sub al,32 
            mov [si],al         
        Boqua2:
            inc si
            loop Lap2
            
            call Xuat
            
            mov ah,4ch             
            int 21h                 
        main endp                        
                                                              
        Xuat proc                  
            mov cl,[mang+1]         
            lea si,mang+2                     
            lap:                              
            mov dl,[si]                     
            mov ah,02h                     
            int 21h                         
            inc si                        
            loop lap        
            ret
        Xuat endp
        
    end main 