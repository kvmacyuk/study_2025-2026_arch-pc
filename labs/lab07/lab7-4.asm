%include 'in_out.asm'

SECTION .data
msg1: db 'Введите x: ',0h
msg2: db 'Введите a: ',0h
msg3: db 'Результат выполнения функции: ',0h

SECTION .bss
res: resb 10
x: resb 10
a: resb 10


SECTION .text
GLOBAL _start
_start:

; ----------------- Вывод сообщения 'Введите x: '
mov eax,msg1
call sprint

; ----------------- Ввод x
mov ecx, x
mov edx,10
call sread

; ----------------- Вывод сообщения 'Введите a: '
mov eax,msg2
call sprint

; ----------------- Ввод a
mov ecx, a
mov edx,10
call sread

; ---------- Преобразование 'x' из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'

; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a], eax ; запись преобразованного числа в 'a'

cmp [x], eax 	; Сравниваем x и a
jl less		; если 'x<a', то переход на метку 'less'

mov ecx, 8
mov [res], ecx	; иначе - присваиваем результату значение 8 и переходим к финальной части программы
jmp end

less:
	mov eax, [a]	; eax = a
	mov ebx, 2	; ebx = 2
	mul ebx		; eax = eax*ebx
	sub eax, [x]	; eax = eax-x
	mov [res], eax	; res = eax

end:
	mov eax, msg3
	call sprint ; Вывод сообщения 'Результат выполнения функции: '
	mov eax,[res]
	call iprintLF	; Вывод результата
	call quit
