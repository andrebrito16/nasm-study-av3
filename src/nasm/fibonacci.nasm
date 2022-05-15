;-------------------------------------
; fibonacci.nasm
; Leia o README.md para detalhes
;-------------------------------------
; 11 primeiros números da sequência de fibonacci
; de RAM[10] a RAM[20]

; Contador em RAM[0]
leaw $0, %A
movw %A, (%A)

leaw $10, %A
movw $0, (%A) ; RAM[10] = 0

leaw $11, %A
movw $1, (%A) ; RAM[11] = 1

LOOP:
  leaw $12, %A
  movw %A, %D ; 12 -> D
  leaw $0, %A
  addw (%A), %D, %D ; Salva o próximo endereço no registrador D
  leaw $1, %A
  movw %D, (%A) ; Salva o endereço de memória que quero salvar no final em RAM[1] - Salvei 12 em RAM1
  movw (%A), %D ; Copia o endereço novamente no registrador D
  decw %D ; Subtrai em 1 no D, logo D = 11 agora
  movw %D, %A
  movw (%A), %D ; Copia o endereço de 11 no D
  leaw $1, %A
  movw (%A), %A
  addw (%A), %D, %D
  leaw $1, %A
  movw (%A), %A
  movw %D, (%A)
  ; Adiciona o valor [- 2] na memória
  leaw $1, %A
  movw (%A), %D
  decw %D
  decw %D
  ; Aqui temos o valor do endereço que queremos somar no 12
  movw %D, %A
  movw (%A), %D ; Endereço de 10 no D
  leaw $1, %A
  movw (%A), %A
  addw (%A), %D, %D
  leaw $1, %A
  movw (%A), %A
  movw %D, (%A)
  ; Lógica do loop
  leaw $20, %A
  movw %A, %D
  leaw $1, %A
  subw %D, (%A), %D
  leaw $END, %A
  je %D ; Pula para o fim do loop se 20 - contador == 0
  nop

leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $LOOP, %A
jmp
nop

; Fazer o loop 9 vezes
END: