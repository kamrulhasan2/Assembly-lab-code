TITLE: Hex to Bin

.model small
.stack

print macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

.data
    msg1 db 0dh, 0ah, "Enter Two Digit Hex No:$"
    msg2 db 0dh, 0ah, "The Binary Number is:$"
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    print msg1
    
    xor bx, bx      ; Clear BX
    mov cl, 4       ; Counter for 4 Shifts
    mov ah, 01h     ; Input Character Function
    int 21h
    
    while_:
        cmp al, 0dh     ; Character?
        je end_while    ; Yes, Exit     je = Jump if Equal
        cmp al, 39h     ; A digit?
        jg letter       ; No, a Letter  jg = Jump if Greater
        jmp shift       ; Go to insert in BX
    
    letter:
        sub al, 37h     ; Convert Letter to Binary Value
        
    shift:
        shl bl, cl      ; Make room for new value   shl = Shift Left
        and al, 0fh
        or bl, al       ; Put value into low 4 bits of BX
        int 21h         ; Input a Character
        jmp while_      ; Loop until chracter
        
    end_while:
        print msg2
        mov ah, bl
        mov cx, 8
        
    L1:
        shl ah, 1
        mov dl, '0'
        jnc L2
        mov dl, '1'
        
    L2: 
        push ax
        mov ah, 2
        int 21h
        pop ax
        loop L1
    
    mov ah, 4ch
    int 21h
    
    main endp
end main
        