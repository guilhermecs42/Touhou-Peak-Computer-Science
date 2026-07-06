deltaAzul: var #1
deltaVerde: var #1
deltaVermelho: var #1
widthTela: var #1
;tamQuadrado: var #1

static deltaAzul + #0, #256
static deltaVerde + #0, #1024
static deltaVermelho + #0, #8192
static widthTela + #0, #40 
;static tamQuadrado + #0, #16

jmp main

main:

; r0 contador azul 0-3, define o quadradao
; r1 contador verde 0-7
; r2 contador vermelho 0-7
; r3 cor

; posicaoAzul11 = (7-r1) + (7-r2)*widthTela, quadradao superior esquerdo
; posicaoAzul10 = (7-r1) + (7-r2)*widthTela + 8, quadradao superior direito
; posicaoAzul01 = (7-r1) + (r2)*widthTela, quadradao inferior esquerdo
; posicaoAzul00 = (7-r1) + (r2)*widthTela + 8, quadradao inferior direito

loadn r0, #3
loadn r1, #7
loadn r2, #7
loadn r3, #0

loop:

; CALCULANDO A COR

; r3 cor temporaria
; r4 deltaCor, temp
loadn r3, #0

load r4, deltaAzul
mul r4, r4, r0
add r3, r3, r4
load r4, deltaVerde
mul r4, r4, r1
add r3, r3, r4
load r4, deltaVermelho
mul r4, r4, r2
add r3, r3, r4

; CALCULANDO POSICAO

; r6 = define quadradao inferior vs superior
; r7 = define quadradao esquerdo vs direito
loadn r5, #8

mov r6, r0 ; se segundo bit de r0 for 1, eh superior, r6 vale 0, senao vale 8
shiftr0 r6, #1
shiftl0 r6, #3
xor r6, r6, r5

mov r7, r0
shiftl0 r7, #15
shiftr0 r7, #12
xor r7, r7, r5

; r4 = r2 + r6
; r5 = widthTela
add r4, r2, r6 ; vermelho e inferior/superior determina a linha
load r5, widthTela
mul r4, r4, r5
add r4, r4, r1 ; verde determina coluna
add r4, r4, r7 ; quadradao esquerdo/direito

; IMPRININDO

; r3 cor
; r4 posicao
loadn r7, #125 ; caractere
add r7, r7, r3 ; caractere + cor
outchar r7, r4 ; imprimindo

; INCREMENTANDO CORES

; r4 temp
loadn r4, #65535
dec r1 ; inc verde
cmp r1, r4
jne skip_zerar_verde
loadn r1, #7 ; zera verde
dec r2 ; inc vermelho
skip_zerar_verde:
cmp r2, r4
jne skip_zerar_vermelho
loadn r2, #7 ; zera vermelho
dec r0 ; incrementa azul
skip_zerar_vermelho:
cmp r0, r4
jeq parar_programa

jmp loop

parar_programa:
halt
