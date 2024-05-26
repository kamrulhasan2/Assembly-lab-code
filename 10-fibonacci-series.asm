TITLE: Fibonacci Series

.model small
.stack 100h

print macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

.data
    msg1 db "Fibonacci Series: ", 0dh, 0ah, " 00", 0dh, 0ah, " 01 $"
    msg2 db 0dh, 0ah, ' $'

.code 

int2asc proc
    push ax
    push bx
    push cx
    push dx
    
    mov cx, 0000h
    mov bx, 0ah
    
    rpt:
        mov dx, 00h
        div bx
        add dl, '0'
        inc cx
        push dx
        cmp ax, 0ah
    jge rpt
    
    add al, '0'
    inc cx
    push ax
    
    print2:
        pop dx
        mov ah, 02h
        int 21h
    loop print2
    
     pop dx
     pop cx
     pop bx
     pop ax
    ret        ; return to main
int2asc endp
    
fibonacci proc
          mov al, 1
          mov bl, 0
          mov cx, 8
          
     step:
          push ax
          add al, bl
          push ax
          print msg2
          pop ax
          mov ah, 00
          call int2asc
          pop bx
     loop step
     ret
fibonacci endp

start:
          mov ax, @data
          mov ds, ax
          print msg1
          call fibonacci
          mov ah, 4ch
          int 21h
end start 
