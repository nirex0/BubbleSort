org 100h

.data

str db 10,13,”Enter Values: $”
str1 db 0dh,0ah,”Sorted: $”
array db 10dup(0)

.code

mov ah,9
lea dx,str
int 21h

mov cx,10
mov bx,offset array
mov ah,1

inputs:
int 21h
mov [bx],al
inc bx
Loop inputs

mov cx,10
dec cx

nextscan:
mov bx,cx
mov si,0

nextcomp:
mov al,array[si] mov dl,array[si+1] cmp al,dl

jc noswap

mov array[si],dl
mov array[si+1],al

noswap:
inc si
dec bx
jnz nextcomp

loop nextscan

mov ah,9
lea dx,str1
int 21h

mov cx,10
mov bx,offset array

print:
mov ah,2
mov dl,[bx] int 21h
inc bx
loop print

ret
