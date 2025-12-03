%include 'in_out.asm'

SECTION .data
msg1 db "Функция: f(x)=2x+15",0h
msg2 db "Результат: ",0h

SECTION .text
global _start

_start:
mov eax, msg1 ; вывод сообщения "Функция..."
call sprintLF

pop ecx ; Извлекаем из стека в `ecx` количество аргументов (первое значение в стеке)
pop edx ; Извлекаем из стека в `edx` имя программы (второе значение в стеке)
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)
mov esi, 0

next:
cmp ecx,0h ; проверяем, есть ли еще аргументы
jz _end ; если аргументов нет выходим из цикла
pop eax ; иначе извлекаем следующий аргумент из стека
call atoi
mov ebx,2
mul ebx
add eax,15
add esi, eax
loop next ; переход к обработке следующего аргумента

_end:
mov eax, msg2 ; вывод сообщения "Результат: "
call sprint
mov eax, esi ; записываем сумму в регистр `eax`
call iprintLF ; печать результата
call quit ; завершение программы
