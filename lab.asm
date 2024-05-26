; A1: 8086 assembly program to take a character and print it in the opposite case
.code
proc main
    mov ah, 01h
    int 21h
    
    cmp al, 'a'
    jge LOWERCASE
    
    UPPERCASE:
    add al, 20h
    
    jmp OUTPUT
    
    LOWERCASE:
    sub al, 20h
    
    OUTPUT:
    mov bl, al
    
    mov dl, 0dh
    mov ah, 02h
    int 21h     
    
    mov dl, 0ah
    mov ah, 02h
    int 21h   
    
    mov dl, bl
    mov ah, 02h
    int 21h 
    
    mov ah, 4ch
    int 21h
    
    main endp
end main

; A2: 8086 assembly program to determine wherther a single digit number is odd or even
.data
ODD_MSG db 0dh, 0ah, "This number is odd$"
EVEN_MSG db 0dh, 0ah, "This number is even$"
.code
macro print msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm                                                                             

proc main
    mov ax, @data
    mov ds, ax
    
    mov ah, 01h
    int 21h
    
    sub al, '0'
    mov bl, 2
    
    div bl
    
    cmp ah, 0
    jz EVEN
    
    ODD:
    print ODD_MSG
    
    jmp END
    
    EVEN:
    print EVEN_MSG
    
    END:   
    mov ah, 4ch
    int 21h
    
    main endp
end main

; A3: 8086 assembly program to add two single digit decimal numbers where sum is also single digit
.code
proc main
    mov ah, 01h
    int 21h  
    
    sub al, '0'
    mov bh, al
    
    mov ah, 01h
    int 21h  
              
    sub al, '0'              
    mov bl, al
    
    add bl, bh
    add bl, '0'
    
    mov ah, 02h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main

; A4: 8086 assembly program to print all characters of alphabet
.code
proc main
    mov cx, 26
    
    mov dl, 'a'
    
    STEP:
    mov ah, 02h
    int 21h
    
    inc dl
    
    loop STEP 
    
    mov ah, 4ch
    int 21h
    
    main endp
end main

; A5: 8086 assembly program to take two numbers and display the smaller one
.code
proc main
    mov ah, 01h
    int 21h
    
    mov bh, al
    
    int 21h
    
    mov bl, al
              
    mov ah, 02h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    cmp bh, bl
    jl PRINT_BH
   
    mov dl, bl
    mov ah, 02h
    int 21h
    
    jmp END 
    
    PRINT_BH:         
    mov dl, bh
    mov ah, 02h
    int 21h
 
    END:   
    mov ah, 4ch
    int 21h
    
    main endp
end main

; B1: 8086 assembly program to find the largest element in an array
.data
arr db 1,2,3,4,5
largest db ?
msg db "Largest element is: $"
.code
proc main
    mov ax, @data
    mov ds, ax
    
    lea di, arr
    mov cx, 5
    mov al, [di]
    mov largest, al
    
    STEP:
    inc di
    mov bl, [di]
    
    cmp largest, bl
    jge CONTINUE
    
    mov largest, bl
    
    CONTINUE:
    loop STEP
    
    lea dx, msg
    mov ah, 09h
    int 21h
    
    add largest, '0'
    mov dl, largest
    mov ah, 02h
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main

; B2: 8086 assembly program to find the average of an array
.data
arr db 1, 2, 3, 4, 5     
sum dw 0            
avg db ?            
msg db "Average is: $"

.code
main proc
    mov ax, @data     
    mov ds, ax
    
    lea di, arr       
    mov cx, 5         
    xor ax, ax        
    xor dx, dx        
    
    SUM_LOOP:
    mov al, [di]   
    add dx, ax     
    inc di        
    loop SUM_LOOP  
    
    mov ax, dx        
    mov bl, 5        
    div bl            
    mov avg, al      
    
    lea dx, msg      
    mov ah, 09h       
    int 21h          
    
    add avg, '0'     
    mov dl, avg      
    mov ah, 02h       
    int 21h         
    
    mov ah, 4ch       
    int 21h         
    
    main endp
end main

; B3: 8086 assembly program to find factorial of 3
.code
proc main
    mov cl, 3
    mov al, 1
    
    FACTORIAL_LOOP:
    mul cl
    loop FACTORIAL_LOOP
    
    add al, '0'
    mov ah, 02h
    mov dl, al
    int 21h
       
    mov ah, 4ch
    int 21h
    
    main endp
end main