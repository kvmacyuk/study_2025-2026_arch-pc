%include 'in_out.asm'

SECTION .data
A: dd 17
B: dd 23
C: dd 45
msg: db 'Наименьшее число: ',0

SECTION .bss
min: resb 10

SECTION .text
GLOBAL _start
_start:

; ---------- Записываем 'A' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'

; ---------- Сравниваем 'A' и 'С'
cmp ecx,[C] ; Сравниваем 'A' и 'С'
jl check_B ; если 'A<C', то переход на метку 'check_B',
mov ecx, [C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'

check_B:
; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
	mov ecx,[min]
	cmp ecx,[B] ; Сравниваем 'min(A,C)' и 'B'
	jl fin ; если 'min(A,C)<B', то переход на 'fin',
	mov ecx,[B] ; иначе 'ecx = B'
	mov [min],ecx
; ---------- Вывод результата
fin:
	mov eax, msg
	call sprint ; Вывод сообщения 'Наименьшее число: '
	mov eax,[min]
	call iprintLF ; Вывод 'min(A,B,C)'
	call quit ; Выход


