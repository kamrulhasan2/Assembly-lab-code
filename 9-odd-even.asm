TITLE: ODD or EVEN

.model small
print macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm        ;end of macro

.data
    msg1 db 0dh,0ah, 'Enter One Digit Number: $'
    msg2 db 0dh,0ah, 'It is an Even Number.$'
    msg3 db 0dh,0ah, 'It is an Odd Number.$'
    
.code

    main proc
            mov ax,@data
            mov ds,ax
            
            print msg1
            mov ah,01h
            int 21h
            
            sub al,30h
            
            mov bl,02
            
            div bl
            
            cmp ah,00
            jz s2
            
            print msg3
            jmp L4
            
            s2:
            print msg2
            
            L4:
            mov ah,4ch
            int 21h
            main endp
    end main  
    