 ; вариант 1

%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
div: DB 'Результат: ',0
SECTION .bss
result: RESB 80
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax,msg
call sprintLF
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
mov ebx,2
mul ebx
add eax,10
mov ebx,3
div ebx
mov ebx,eax
mov eax,div
call sprint
mov eax,result
mov eax,ebx
call iprintLF
call quit
