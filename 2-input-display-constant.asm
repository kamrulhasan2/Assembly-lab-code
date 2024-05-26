TITLE: INPUT & DISPLAY CONSTANT CHARACTER

.model small
.stack 
.data 
.code
main proc
    
    mov ah, 01
    int 21h  
    
    mov dl, al
    
    mov ah, 02      ; character output fuction
    int 21h

  main endp
end main
                                  