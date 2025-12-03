%include 'in_out.asm'

SECTION .data
	msg1 db 'Введите N: ', 0

SECTION .bss
	N: resb 10

SECTION .text
	global _start
_start:

; Вывод сообщения
mov eax,msg1
call sprint

; Ввод N
mov ecx, N
mov edx, 10
call sread

; Преобразование из символа в число
mov eax,N
call atoi
mov [N], eax

; Организация цикла
mov ecx,[N]
label:
push ecx
sub ecx,1
mov [N],ecx
mov eax,[N]
call iprintLF
pop ecx

loop label

call quit

