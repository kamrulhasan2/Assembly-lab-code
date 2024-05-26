TITLE: DISPLAY CHARACTER WITH NEW LINE    

;New Line: 0dh 0ah

.model small
.stack
.code

main proc
         mov ah, 01h    ; Call input function
         int 21h        ; For Interrupt
         
         mov bl, al     ; Saving value of al into bl
         
         mov dl, 0dh    ; Carriage return i.e., moves cursor
         mov ah, 02h    ; Call output fuction
         int 21h        ; For Interrupt
         
         mov dl, 0ah    ; New line feed
         int 21h        ; Interrupt
         
         mov dl, bl     ; Transfer value of bl into dl
         int 21h        ; Interrupt
         
         mov ah, 4ch    ; Return to DOS
         int 21h        ; For Interrupt
    main endp
end main
                              