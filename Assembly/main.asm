jmp main:

; VARIAVEIS ESTATICAS

PlayerX: var #1
PlayerY: var #1
PlayerV: var #1 ; == -1 + quantos frames movem o personagem
FrameMod: var #1 ; 00...0 se nao move no frame, 11...1 se move no frame




main:
	
	static PlayerX + #0, #15
	static PlayerY + #0, #15
	static PlayerV + #0, #4

	inchar r0
	call PROCESSAR_INPUT
	call LIMPAR_TELA
	call RENDER_PERSONAGEM
	call ANTIDEBUG

	load r1, #FrameMod

	loadn r2, #0
	cmp r2, r1
	cne DELAY

	inc r1
	loadn r2, #5 ; IMPORTANTE, ISSO É O MOD DO FrameMod
	mod r1, r1, r2
	store #FrameMod, r1

	jmp main




;internos: r0, r1, r6, r7
DEBUG:

	push r0
	push r1
	loadn r0, #'D'
	loadn r1, #1199

	outchar r0, r1

	pop r1
	pop r0
	rts




;internos: r0, r1
ANTIDEBUG: ; CHAMADO SEMPRE NA MAIN!!!

	push r0
	push r1
	loadn r0, #'A'
	loadn r1, #1199

	outchar r0, r1

	pop r1
	pop r0
	rts




DELAY:
	push r0
	push r1
	loadn r0, #2500
	loadn r1, #0

	DELAY_loop:
	dec r0
	cmp r1, r0
	jne DELAY_loop

	pop r1
	pop r0
	rts

;internos: r0, r1, r2
LIMPAR_TELA:
	push r0
	push r1
	push r2

	loadn r0, #0 ; comparação
	load r1, #FrameMod
	cmp r1, r0
	jne LIMPAR_TELA_loop_fim
	
	loadn r0, #0 ; posicao
	loadn r1, #1200 ; char
	loadn r2, #127

	LIMPAR_TELA_loop:
	cmp r0, r1
	jeg LIMPAR_TELA_loop_fim
	outchar r2, r0
	inc r0
	jmp LIMPAR_TELA_loop
	LIMPAR_TELA_loop_fim:

	pop r2
	pop r1
	pop r0
	rts




RENDER_PERSONAGEM:
	load r0, #PlayerY
	loadn r1, #40
	mul r0, r0, r1
	load r1, #PlayerX
	add r0, r0, r1
	loadn r1, #'@'	
	outchar r1, r0
	rts




;descobre qual tecla foi apertada com uma arvore binaria e chama a função correspondente
; w=119, a=97, s=115, d=100, x=120, ESC=27, Enter=13, shift diminui em 32
;input: r0 tecla, r2 NÃO PODE SER 22
;internos: r1 comparação, r2 comparação, r3=PlayerX, r4=PlayerY, r5=PlayerV
;output: r0 fica com valor shiftado se for wasd
PROCESSAR_INPUT:
	load r3, #PlayerX
	load r4, #PlayerY
	loadn r5, #1
	
	loadn r1, #27
	cmp r0, r1
	jel PROCESSAR_INPUT_esq ; ESC, Enter
	; agora sao inputs de movimento, precisamos shiftar todos
	loadn r1, #97
	cmp r0, r1
	jle PROCESSAR_INPUT_skippar_frames_modo_rapido
	; o codigo abaixo so executa se shift estiver desativado (modo lento)

	loadn r2, #32
	sub r0, r0, r2
	; SKIPPAR FRAMES NO MODO LENTO
	load r1, #FrameMod ; r1 pode ser 0, 1, 2 inicialmente
	loadn r2, #0
	cmp r1, r2 ; r1 é FrameMod
	jne PROCESSAR_INPUT_RET
	call DEBUG
	jmp PROCESSAR_INPUT_dir

	PROCESSAR_INPUT_skippar_frames_modo_rapido:
	load r1, #FrameMod ; r1 pode ser 0, 1, 2 inicialmente
	load r2, #PlayerV
	cmp r1, r2 ; r1 é FrameMod
	jgr PROCESSAR_INPUT_RET

	PROCESSAR_INPUT_dir:

	loadn r1, #83
	cmp r0, r1
	jle PROCESSAR_INPUT_dir_esq
	jeq MOVER_BAIXO
	loadn r1, #88
	cmp r0, r1
	jle MOVER_CIMA
	jeq USAR_BOMBA
	jmp PROCESSAR_INPUT_RET
	PROCESSAR_INPUT_dir_esq:
	loadn r1, #65
	cmp r0, r1
	jeq MOVER_ESQUERDA
	jmp MOVER_DIREITA
	PROCESSAR_INPUT_esq:
	jeq ESC
	jmp ENTER

	PROCESSAR_INPUT_RET:

	PROCESSAR_INPUT_x_min:
	loadn r1, #10
	cmp r3, r1
	jeg PROCESSAR_INPUT_x_max
	mov r3, r1

	PROCESSAR_INPUT_x_max:
	loadn r1, #39
	cmp r3, r1
	jel PROCESSAR_INPUT_y_underflow
	mov r3, r1

	PROCESSAR_INPUT_y_underflow:
	loadn r1, #100
	cmp r4, r1
	jle PROCESSAR_INPUT_y_max
	xor r4, r4, r4

	PROCESSAR_INPUT_y_min:
	loadn r1, #0
	cmp r4, r1
	jeg PROCESSAR_INPUT_y_max
	mov r4, r1

	PROCESSAR_INPUT_y_max:
	loadn r1, #29
	cmp r4, r1
	jel PROCESSAR_INPUT_cauda
	mov r4, r1

	PROCESSAR_INPUT_cauda:
	
	store #PlayerX, r3
	store #PlayerY, r4
	rts




; input: r3=PlayerX,r4=PlayerY,r5=PlayerV
; interno: r1=Mov, v
MOVER_CIMA:
	sub r4, r4, r5
	jmp PROCESSAR_INPUT_RET
MOVER_ESQUERDA:
	sub r3, r3, r5
	jmp PROCESSAR_INPUT_RET
MOVER_BAIXO:
	add r4, r4, r5
	jmp PROCESSAR_INPUT_RET
MOVER_DIREITA:
	add r3, r3, r5
	jmp PROCESSAR_INPUT_RET

USAR_BOMBA:
	loadn r7, #120
	jmp PROCESSAR_INPUT_RET

ESC:
	loadn r7, #27
	jmp PROCESSAR_INPUT_RET

ENTER:
	loadn r7, #13
	jmp PROCESSAR_INPUT_RET