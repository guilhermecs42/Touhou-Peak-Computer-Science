; VARIAVEIS ESTATICAS

PlayerX: var #1
PlayerY: var #1
PlayerV: var #1 ; -1 + quantos frames movem o personagem
FrameMod: var #1 ; 00...0 se nao move no frame, 11...1 se move no frame




main:
	
	static PlayerX + #0, #15
	static PlayerY + #0, #15
	static PlayerV + #0, #4

	inchar r0
	call LIMPAR_TELA
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