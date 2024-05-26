# Assembly-lab-code

<b>1. DISPLAY CONSTANT CHARACTER </b></br>

.model small
.stack
.code
main proc
mov ah, 02 ; output function (ah = accumulator higher)
mov dl, '*' ; data to output (data lower part)
int 21h

mov ah, 4ch ; return from fuction
int 21h
main endp
end main
