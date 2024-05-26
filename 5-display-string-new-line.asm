TITLE: DISPLAY CONSTANT STRING NEW LINE

.model small
.stack
.data
      A db "COMPUTER", 0dh, 0ah, "SCINECE$" 

main proc
          mov ax, @data ; Transfer 16-bit address to ax register,
                        ; initialize data segment register
          mov ds, ax    ; Transfer contents of ax into ds register
          
        ; lea = Load Effective Address
          lea dx, A     ; Before using A define 16-bit address of variable of .data
          mov ah, 09h   ; String Display Function
          int 21h       ; Interrupt
          
          mov ah, 4ch   ; Return to DOS
          int 21h       
    main endp
end main
                              