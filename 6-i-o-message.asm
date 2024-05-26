TITLE: INPUT & DISPLAY CONSTANT STRING NEW LINE

.model small
.stack
.data
      A db "Enter Constant: $"
      B db 0dh, 0ah, "Output: $"

main proc
          mov ax, @data ; Transfer 16-bit address to ax register,
                        ; initialize data segment register
          mov ds, ax    ; Transfer contents of ax into ds register
          
        ; lea = Load Effective Address
          lea dx, A     ; Before using A define 16-bit address of variable of .data
          mov ah, 09h   ; String Display Function
          int 21h       ; Interrupt 
          
          mov ah, 01h
          int 21h
    
          mov bl, al      ; move input data to temp reg
       
 
          
          lea dx, B
          mov ah, 09h     ; String Display Function
          int 21h 
          
          mov ah, 02      ; output function (ah = accumulator higher part)
          mov dl, bl      ; data to output (dl = data lower part)
          int 21h
    
          mov ah, 4ch     ; Return from function
          int 21h
          
          mov ah, 4ch     ; Return to DOS
          int 21h       
    main endp
end main
                              