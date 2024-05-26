TITLE: Display Message Using Macro
    
print macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm

.model small
.data
    msg1 db 0dh, 0ah,"Assembly Lab $"
.code

main proc
        mov ax, @data
        mov ds, ax
        
        print msg1
        
        mov ah, 4ch
        int 21h
    main endp
end main 
