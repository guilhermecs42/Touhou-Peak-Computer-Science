; VARIAVEIS ESTATICAS

PlayerX: var #1
PlayerY: var #1
PlayerV: var #1 ; -1 + quantos frames movem o personagem
FrameMod: var #1 ; 00...0 se nao move no frame, 11...1 se move no frame

BaseAdressEB: var #1
CurAdressEB: var #1

main:
	
	static PlayerX + #0, #15
	static PlayerY + #0, #15
	static PlayerV + #0, #4
	static BaseAdressEB + #0, #32768
	static CurAdressEB + #0, #32768

	load r0, #CurAdressEB
	loadn r1, #20
	@SET r0, r1, r2, EBPos.x
	loadn r1, #10
	@SET r0, r1, r2, EBPos.y
	loadn r1, #0
	@SET r0, r1, r2, EBPos.t
	loadn r1, #0 ; direita
	@SET r0, r1, r2, EBPos.A
	loadn r1, #1 ; 1 pixel por frame
	@SET r0, r1, r2, EBPos.v

	inchar r0
	call LIMPAR_TELA
	call RENDER_LINHA
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

RENDER_LINHA:
	load r0, #CurAdressEB
	@GET r2, r0, r1, EBPos.x
	@GET r3, r0, r1, EBPos.y
	loadn r1, #40
	mul r3, r3, r1 ; calcula y*40
	add r2, r2, r3 ; calcula x + y*40
	loadn r1, #'X'
	
	outchar r1, r2

	rts

TABELAdx: var #1280
; A = 0
static TABELAdx + #0, #1
static TABELAdx + #1, #1
static TABELAdx + #2, #1
static TABELAdx + #3, #1
static TABELAdx + #4, #1
static TABELAdx + #5, #1
static TABELAdx + #6, #1
static TABELAdx + #7, #1
static TABELAdx + #8, #1
static TABELAdx + #9, #1
static TABELAdx + #10, #1
static TABELAdx + #11, #1
static TABELAdx + #12, #1
static TABELAdx + #13, #1
static TABELAdx + #14, #1
static TABELAdx + #15, #1
; A = 1
static TABELAdx + #16, #1
static TABELAdx + #17, #1
static TABELAdx + #18, #1
static TABELAdx + #19, #1
static TABELAdx + #20, #1
static TABELAdx + #21, #1
static TABELAdx + #22, #1
static TABELAdx + #23, #1
static TABELAdx + #24, #1
static TABELAdx + #25, #1
static TABELAdx + #26, #1
static TABELAdx + #27, #1
static TABELAdx + #28, #1
static TABELAdx + #29, #1
static TABELAdx + #30, #1
static TABELAdx + #31, #1
; A = 2
static TABELAdx + #32, #1
static TABELAdx + #33, #1
static TABELAdx + #34, #1
static TABELAdx + #35, #1
static TABELAdx + #36, #1
static TABELAdx + #37, #1
static TABELAdx + #38, #1
static TABELAdx + #39, #1
static TABELAdx + #40, #1
static TABELAdx + #41, #1
static TABELAdx + #42, #1
static TABELAdx + #43, #1
static TABELAdx + #44, #1
static TABELAdx + #45, #1
static TABELAdx + #46, #1
static TABELAdx + #47, #1
; A = 3
static TABELAdx + #48, #1
static TABELAdx + #49, #1
static TABELAdx + #50, #1
static TABELAdx + #51, #1
static TABELAdx + #52, #1
static TABELAdx + #53, #1
static TABELAdx + #54, #1
static TABELAdx + #55, #1
static TABELAdx + #56, #1
static TABELAdx + #57, #1
static TABELAdx + #58, #1
static TABELAdx + #59, #1
static TABELAdx + #60, #1
static TABELAdx + #61, #1
static TABELAdx + #62, #1
static TABELAdx + #63, #1
; A = 4
static TABELAdx + #64, #1
static TABELAdx + #65, #1
static TABELAdx + #66, #1
static TABELAdx + #67, #1
static TABELAdx + #68, #1
static TABELAdx + #69, #1
static TABELAdx + #70, #1
static TABELAdx + #71, #1
static TABELAdx + #72, #1
static TABELAdx + #73, #1
static TABELAdx + #74, #1
static TABELAdx + #75, #1
static TABELAdx + #76, #1
static TABELAdx + #77, #1
static TABELAdx + #78, #1
static TABELAdx + #79, #1
; A = 5
static TABELAdx + #80, #1
static TABELAdx + #81, #1
static TABELAdx + #82, #1
static TABELAdx + #83, #1
static TABELAdx + #84, #1
static TABELAdx + #85, #1
static TABELAdx + #86, #1
static TABELAdx + #87, #1
static TABELAdx + #88, #1
static TABELAdx + #89, #1
static TABELAdx + #90, #1
static TABELAdx + #91, #1
static TABELAdx + #92, #1
static TABELAdx + #93, #1
static TABELAdx + #94, #1
static TABELAdx + #95, #1
; A = 6
static TABELAdx + #96, #1
static TABELAdx + #97, #1
static TABELAdx + #98, #1
static TABELAdx + #99, #1
static TABELAdx + #100, #1
static TABELAdx + #101, #1
static TABELAdx + #102, #1
static TABELAdx + #103, #1
static TABELAdx + #104, #1
static TABELAdx + #105, #1
static TABELAdx + #106, #1
static TABELAdx + #107, #1
static TABELAdx + #108, #1
static TABELAdx + #109, #1
static TABELAdx + #110, #1
static TABELAdx + #111, #1
; A = 7
static TABELAdx + #112, #1
static TABELAdx + #113, #1
static TABELAdx + #114, #1
static TABELAdx + #115, #1
static TABELAdx + #116, #1
static TABELAdx + #117, #1
static TABELAdx + #118, #1
static TABELAdx + #119, #1
static TABELAdx + #120, #1
static TABELAdx + #121, #1
static TABELAdx + #122, #1
static TABELAdx + #123, #1
static TABELAdx + #124, #1
static TABELAdx + #125, #1
static TABELAdx + #126, #1
static TABELAdx + #127, #1
; A = 8
static TABELAdx + #128, #1
static TABELAdx + #129, #1
static TABELAdx + #130, #1
static TABELAdx + #131, #1
static TABELAdx + #132, #1
static TABELAdx + #133, #1
static TABELAdx + #134, #1
static TABELAdx + #135, #1
static TABELAdx + #136, #1
static TABELAdx + #137, #1
static TABELAdx + #138, #1
static TABELAdx + #139, #1
static TABELAdx + #140, #1
static TABELAdx + #141, #1
static TABELAdx + #142, #1
static TABELAdx + #143, #1
; A = 9
static TABELAdx + #144, #1
static TABELAdx + #145, #1
static TABELAdx + #146, #1
static TABELAdx + #147, #1
static TABELAdx + #148, #1
static TABELAdx + #149, #1
static TABELAdx + #150, #1
static TABELAdx + #151, #1
static TABELAdx + #152, #1
static TABELAdx + #153, #1
static TABELAdx + #154, #1
static TABELAdx + #155, #1
static TABELAdx + #156, #1
static TABELAdx + #157, #1
static TABELAdx + #158, #1
static TABELAdx + #159, #1
; A = 10 (diagonal superior direita)
static TABELAdx + #160, #1
static TABELAdx + #161, #1
static TABELAdx + #162, #1
static TABELAdx + #163, #1
static TABELAdx + #164, #1
static TABELAdx + #165, #1
static TABELAdx + #166, #1
static TABELAdx + #167, #1
static TABELAdx + #168, #1
static TABELAdx + #169, #1
static TABELAdx + #170, #1
static TABELAdx + #171, #1
static TABELAdx + #172, #1
static TABELAdx + #173, #1
static TABELAdx + #174, #1
static TABELAdx + #175, #1
; A = 11
static TABELAdx + #176, #1
static TABELAdx + #177, #1
static TABELAdx + #178, #0
static TABELAdx + #179, #1
static TABELAdx + #180, #1
static TABELAdx + #181, #1
static TABELAdx + #182, #1
static TABELAdx + #183, #1
static TABELAdx + #184, #1
static TABELAdx + #185, #0
static TABELAdx + #186, #1
static TABELAdx + #187, #1
static TABELAdx + #188, #1
static TABELAdx + #189, #1
static TABELAdx + #190, #1
static TABELAdx + #191, #1
; A = 12
static TABELAdx + #192, #1
static TABELAdx + #193, #0
static TABELAdx + #194, #1
static TABELAdx + #195, #1
static TABELAdx + #196, #1
static TABELAdx + #197, #0
static TABELAdx + #198, #1
static TABELAdx + #199, #1
static TABELAdx + #200, #1
static TABELAdx + #201, #0
static TABELAdx + #202, #1
static TABELAdx + #203, #1
static TABELAdx + #204, #1
static TABELAdx + #205, #0
static TABELAdx + #206, #1
static TABELAdx + #207, #1
; A = 13
static TABELAdx + #208, #0
static TABELAdx + #209, #1
static TABELAdx + #210, #0
static TABELAdx + #211, #1
static TABELAdx + #212, #1
static TABELAdx + #213, #0
static TABELAdx + #214, #1
static TABELAdx + #215, #0
static TABELAdx + #216, #1
static TABELAdx + #217, #1
static TABELAdx + #218, #0
static TABELAdx + #219, #1
static TABELAdx + #220, #0
static TABELAdx + #221, #1
static TABELAdx + #222, #1
static TABELAdx + #223, #0
; A = 14
static TABELAdx + #224, #0
static TABELAdx + #225, #1
static TABELAdx + #226, #0
static TABELAdx + #227, #1
static TABELAdx + #228, #0
static TABELAdx + #229, #1
static TABELAdx + #230, #0
static TABELAdx + #231, #1
static TABELAdx + #232, #0
static TABELAdx + #233, #1
static TABELAdx + #234, #0
static TABELAdx + #235, #1
static TABELAdx + #236, #0
static TABELAdx + #237, #1
static TABELAdx + #238, #0
static TABELAdx + #239, #1
; A = 15
static TABELAdx + #240, #0
static TABELAdx + #241, #1
static TABELAdx + #242, #0
static TABELAdx + #243, #0
static TABELAdx + #244, #1
static TABELAdx + #245, #0
static TABELAdx + #246, #1
static TABELAdx + #247, #0
static TABELAdx + #248, #0
static TABELAdx + #249, #1
static TABELAdx + #250, #0
static TABELAdx + #251, #1
static TABELAdx + #252, #0
static TABELAdx + #253, #0
static TABELAdx + #254, #1
static TABELAdx + #255, #0
; A = 16
static TABELAdx + #256, #0
static TABELAdx + #257, #0
static TABELAdx + #258, #1
static TABELAdx + #259, #0
static TABELAdx + #260, #0
static TABELAdx + #261, #1
static TABELAdx + #262, #0
static TABELAdx + #263, #0
static TABELAdx + #264, #1
static TABELAdx + #265, #0
static TABELAdx + #266, #0
static TABELAdx + #267, #1
static TABELAdx + #268, #0
static TABELAdx + #269, #0
static TABELAdx + #270, #1
static TABELAdx + #271, #0
; A = 17
static TABELAdx + #272, #0
static TABELAdx + #273, #0
static TABELAdx + #274, #0
static TABELAdx + #275, #1
static TABELAdx + #276, #0
static TABELAdx + #277, #0
static TABELAdx + #278, #0
static TABELAdx + #279, #1
static TABELAdx + #280, #0
static TABELAdx + #281, #0
static TABELAdx + #282, #0
static TABELAdx + #283, #1
static TABELAdx + #284, #0
static TABELAdx + #285, #0
static TABELAdx + #286, #0
static TABELAdx + #287, #1
; A = 18
static TABELAdx + #288, #0
static TABELAdx + #289, #0
static TABELAdx + #290, #0
static TABELAdx + #291, #0
static TABELAdx + #292, #1
static TABELAdx + #293, #0
static TABELAdx + #294, #0
static TABELAdx + #295, #0
static TABELAdx + #296, #0
static TABELAdx + #297, #1
static TABELAdx + #298, #0
static TABELAdx + #299, #0
static TABELAdx + #300, #0
static TABELAdx + #301, #0
static TABELAdx + #302, #1
static TABELAdx + #303, #0
; A = 19
static TABELAdx + #304, #0
static TABELAdx + #305, #0
static TABELAdx + #306, #0
static TABELAdx + #307, #0
static TABELAdx + #308, #0
static TABELAdx + #309, #0
static TABELAdx + #310, #0
static TABELAdx + #311, #1
static TABELAdx + #312, #0
static TABELAdx + #313, #0
static TABELAdx + #314, #0
static TABELAdx + #315, #0
static TABELAdx + #316, #0
static TABELAdx + #317, #0
static TABELAdx + #318, #0
static TABELAdx + #319, #1
; A = 20
static TABELAdx + #320, #0
static TABELAdx + #321, #0
static TABELAdx + #322, #0
static TABELAdx + #323, #0
static TABELAdx + #324, #0
static TABELAdx + #325, #0
static TABELAdx + #326, #0
static TABELAdx + #327, #0
static TABELAdx + #328, #0
static TABELAdx + #329, #0
static TABELAdx + #330, #0
static TABELAdx + #331, #0
static TABELAdx + #332, #0
static TABELAdx + #333, #0
static TABELAdx + #334, #0
static TABELAdx + #335, #0
; A = 21 - 30
; A = 21
static TABELAdx + #336, #0
static TABELAdx + #337, #0
static TABELAdx + #338, #0
static TABELAdx + #339, #0
static TABELAdx + #340, #0
static TABELAdx + #341, #0
static TABELAdx + #342, #0
static TABELAdx + #343, #65535
static TABELAdx + #344, #0
static TABELAdx + #345, #0
static TABELAdx + #346, #0
static TABELAdx + #347, #0
static TABELAdx + #348, #0
static TABELAdx + #349, #0
static TABELAdx + #350, #0
static TABELAdx + #351, #65535
; A = 22
static TABELAdx + #352, #0
static TABELAdx + #353, #0
static TABELAdx + #354, #0
static TABELAdx + #355, #0
static TABELAdx + #356, #65535
static TABELAdx + #357, #0
static TABELAdx + #358, #0
static TABELAdx + #359, #0
static TABELAdx + #360, #0
static TABELAdx + #361, #65535
static TABELAdx + #362, #0
static TABELAdx + #363, #0
static TABELAdx + #364, #0
static TABELAdx + #365, #0
static TABELAdx + #366, #65535
static TABELAdx + #367, #0
; A = 23
static TABELAdx + #368, #0
static TABELAdx + #369, #0
static TABELAdx + #370, #0
static TABELAdx + #371, #65535
static TABELAdx + #372, #0
static TABELAdx + #373, #0
static TABELAdx + #374, #0
static TABELAdx + #375, #65535
static TABELAdx + #376, #0
static TABELAdx + #377, #0
static TABELAdx + #378, #0
static TABELAdx + #379, #65535
static TABELAdx + #380, #0
static TABELAdx + #381, #0
static TABELAdx + #382, #0
static TABELAdx + #383, #65535
; A = 24
static TABELAdx + #384, #0
static TABELAdx + #385, #0
static TABELAdx + #386, #65535
static TABELAdx + #387, #0
static TABELAdx + #388, #0
static TABELAdx + #389, #65535
static TABELAdx + #390, #0
static TABELAdx + #391, #0
static TABELAdx + #392, #65535
static TABELAdx + #393, #0
static TABELAdx + #394, #0
static TABELAdx + #395, #65535
static TABELAdx + #396, #0
static TABELAdx + #397, #0
static TABELAdx + #398, #65535
static TABELAdx + #399, #0
; A = 25
static TABELAdx + #400, #0
static TABELAdx + #401, #65535
static TABELAdx + #402, #0
static TABELAdx + #403, #0
static TABELAdx + #404, #65535
static TABELAdx + #405, #0
static TABELAdx + #406, #65535
static TABELAdx + #407, #0
static TABELAdx + #408, #0
static TABELAdx + #409, #65535
static TABELAdx + #410, #0
static TABELAdx + #411, #65535
static TABELAdx + #412, #0
static TABELAdx + #413, #0
static TABELAdx + #414, #65535
static TABELAdx + #415, #0
; A = 26
static TABELAdx + #416, #0
static TABELAdx + #417, #65535
static TABELAdx + #418, #0
static TABELAdx + #419, #65535
static TABELAdx + #420, #0
static TABELAdx + #421, #65535
static TABELAdx + #422, #0
static TABELAdx + #423, #65535
static TABELAdx + #424, #0
static TABELAdx + #425, #65535
static TABELAdx + #426, #0
static TABELAdx + #427, #65535
static TABELAdx + #428, #0
static TABELAdx + #429, #65535
static TABELAdx + #430, #0
static TABELAdx + #431, #65535
; A = 27
static TABELAdx + #432, #0
static TABELAdx + #433, #65535
static TABELAdx + #434, #0
static TABELAdx + #435, #65535
static TABELAdx + #436, #65535
static TABELAdx + #437, #0
static TABELAdx + #438, #65535
static TABELAdx + #439, #0
static TABELAdx + #440, #65535
static TABELAdx + #441, #65535
static TABELAdx + #442, #0
static TABELAdx + #443, #65535
static TABELAdx + #444, #0
static TABELAdx + #445, #65535
static TABELAdx + #446, #65535
static TABELAdx + #447, #0
; A = 28
static TABELAdx + #448, #65535
static TABELAdx + #449, #0
static TABELAdx + #450, #65535
static TABELAdx + #451, #65535
static TABELAdx + #452, #65535
static TABELAdx + #453, #0
static TABELAdx + #454, #65535
static TABELAdx + #455, #65535
static TABELAdx + #456, #65535
static TABELAdx + #457, #0
static TABELAdx + #458, #65535
static TABELAdx + #459, #65535
static TABELAdx + #460, #65535
static TABELAdx + #461, #0
static TABELAdx + #462, #65535
static TABELAdx + #463, #65535
; A = 29
static TABELAdx + #464, #65535
static TABELAdx + #465, #65535
static TABELAdx + #466, #0
static TABELAdx + #467, #65535
static TABELAdx + #468, #65535
static TABELAdx + #469, #65535
static TABELAdx + #470, #65535
static TABELAdx + #471, #65535
static TABELAdx + #472, #65535
static TABELAdx + #473, #0
static TABELAdx + #474, #65535
static TABELAdx + #475, #65535
static TABELAdx + #476, #65535
static TABELAdx + #477, #65535
static TABELAdx + #478, #65535
static TABELAdx + #479, #65535
; A = 30
static TABELAdx + #480, #65535
static TABELAdx + #481, #65535
static TABELAdx + #482, #65535
static TABELAdx + #483, #65535
static TABELAdx + #484, #65535
static TABELAdx + #485, #65535
static TABELAdx + #486, #65535
static TABELAdx + #487, #65535
static TABELAdx + #488, #65535
static TABELAdx + #489, #65535
static TABELAdx + #490, #65535
static TABELAdx + #491, #65535
static TABELAdx + #492, #65535
static TABELAdx + #493, #65535
static TABELAdx + #494, #65535
static TABELAdx + #495, #65535
; A = 31
static TABELAdx + #496, #65535
static TABELAdx + #497, #65535
static TABELAdx + #498, #65535
static TABELAdx + #499, #65535
static TABELAdx + #500, #65535
static TABELAdx + #501, #65535
static TABELAdx + #502, #65535
static TABELAdx + #503, #65535
static TABELAdx + #504, #65535
static TABELAdx + #505, #65535
static TABELAdx + #506, #65535
static TABELAdx + #507, #65535
static TABELAdx + #508, #65535
static TABELAdx + #509, #65535
static TABELAdx + #510, #65535
static TABELAdx + #511, #65535
; A = 32
static TABELAdx + #512, #65535
static TABELAdx + #513, #65535
static TABELAdx + #514, #65535
static TABELAdx + #515, #65535
static TABELAdx + #516, #65535
static TABELAdx + #517, #65535
static TABELAdx + #518, #65535
static TABELAdx + #519, #65535
static TABELAdx + #520, #65535
static TABELAdx + #521, #65535
static TABELAdx + #522, #65535
static TABELAdx + #523, #65535
static TABELAdx + #524, #65535
static TABELAdx + #525, #65535
static TABELAdx + #526, #65535
static TABELAdx + #527, #65535
; A = 33
static TABELAdx + #528, #65535
static TABELAdx + #529, #65535
static TABELAdx + #530, #65535
static TABELAdx + #531, #65535
static TABELAdx + #532, #65535
static TABELAdx + #533, #65535
static TABELAdx + #534, #65535
static TABELAdx + #535, #65535
static TABELAdx + #536, #65535
static TABELAdx + #537, #65535
static TABELAdx + #538, #65535
static TABELAdx + #539, #65535
static TABELAdx + #540, #65535
static TABELAdx + #541, #65535
static TABELAdx + #542, #65535
static TABELAdx + #543, #65535
; A = 34
static TABELAdx + #544, #65535
static TABELAdx + #545, #65535
static TABELAdx + #546, #65535
static TABELAdx + #547, #65535
static TABELAdx + #548, #65535
static TABELAdx + #549, #65535
static TABELAdx + #550, #65535
static TABELAdx + #551, #65535
static TABELAdx + #552, #65535
static TABELAdx + #553, #65535
static TABELAdx + #554, #65535
static TABELAdx + #555, #65535
static TABELAdx + #556, #65535
static TABELAdx + #557, #65535
static TABELAdx + #558, #65535
static TABELAdx + #559, #65535
; A = 35
static TABELAdx + #560, #65535
static TABELAdx + #561, #65535
static TABELAdx + #562, #65535
static TABELAdx + #563, #65535
static TABELAdx + #564, #65535
static TABELAdx + #565, #65535
static TABELAdx + #566, #65535
static TABELAdx + #567, #65535
static TABELAdx + #568, #65535
static TABELAdx + #569, #65535
static TABELAdx + #570, #65535
static TABELAdx + #571, #65535
static TABELAdx + #572, #65535
static TABELAdx + #573, #65535
static TABELAdx + #574, #65535
static TABELAdx + #575, #65535
; A = 36
static TABELAdx + #576, #65535
static TABELAdx + #577, #65535
static TABELAdx + #578, #65535
static TABELAdx + #579, #65535
static TABELAdx + #580, #65535
static TABELAdx + #581, #65535
static TABELAdx + #582, #65535
static TABELAdx + #583, #65535
static TABELAdx + #584, #65535
static TABELAdx + #585, #65535
static TABELAdx + #586, #65535
static TABELAdx + #587, #65535
static TABELAdx + #588, #65535
static TABELAdx + #589, #65535
static TABELAdx + #590, #65535
static TABELAdx + #591, #65535
; A = 37
static TABELAdx + #592, #65535
static TABELAdx + #593, #65535
static TABELAdx + #594, #65535
static TABELAdx + #595, #65535
static TABELAdx + #596, #65535
static TABELAdx + #597, #65535
static TABELAdx + #598, #65535
static TABELAdx + #599, #65535
static TABELAdx + #600, #65535
static TABELAdx + #601, #65535
static TABELAdx + #602, #65535
static TABELAdx + #603, #65535
static TABELAdx + #604, #65535
static TABELAdx + #605, #65535
static TABELAdx + #606, #65535
static TABELAdx + #607, #65535
; A = 38
static TABELAdx + #608, #65535
static TABELAdx + #609, #65535
static TABELAdx + #610, #65535
static TABELAdx + #611, #65535
static TABELAdx + #612, #65535
static TABELAdx + #613, #65535
static TABELAdx + #614, #65535
static TABELAdx + #615, #65535
static TABELAdx + #616, #65535
static TABELAdx + #617, #65535
static TABELAdx + #618, #65535
static TABELAdx + #619, #65535
static TABELAdx + #620, #65535
static TABELAdx + #621, #65535
static TABELAdx + #622, #65535
static TABELAdx + #623, #65535
; A = 39
static TABELAdx + #624, #65535
static TABELAdx + #625, #65535
static TABELAdx + #626, #65535
static TABELAdx + #627, #65535
static TABELAdx + #628, #65535
static TABELAdx + #629, #65535
static TABELAdx + #630, #65535
static TABELAdx + #631, #65535
static TABELAdx + #632, #65535
static TABELAdx + #633, #65535
static TABELAdx + #634, #65535
static TABELAdx + #635, #65535
static TABELAdx + #636, #65535
static TABELAdx + #637, #65535
static TABELAdx + #638, #65535
static TABELAdx + #639, #65535
; A = 40
static TABELAdx + #640, #65535
static TABELAdx + #641, #65535
static TABELAdx + #642, #65535
static TABELAdx + #643, #65535
static TABELAdx + #644, #65535
static TABELAdx + #645, #65535
static TABELAdx + #646, #65535
static TABELAdx + #647, #65535
static TABELAdx + #648, #65535
static TABELAdx + #649, #65535
static TABELAdx + #650, #65535
static TABELAdx + #651, #65535
static TABELAdx + #652, #65535
static TABELAdx + #653, #65535
static TABELAdx + #654, #65535
static TABELAdx + #655, #65535
; A = 41 - 79
; A = 41
static TABELAdx + #656, #65535
static TABELAdx + #657, #65535
static TABELAdx + #658, #65535
static TABELAdx + #659, #65535
static TABELAdx + #660, #65535
static TABELAdx + #661, #65535
static TABELAdx + #662, #65535
static TABELAdx + #663, #65535
static TABELAdx + #664, #65535
static TABELAdx + #665, #65535
static TABELAdx + #666, #65535
static TABELAdx + #667, #65535
static TABELAdx + #668, #65535
static TABELAdx + #669, #65535
static TABELAdx + #670, #65535
static TABELAdx + #671, #65535
; A = 42
static TABELAdx + #672, #65535
static TABELAdx + #673, #65535
static TABELAdx + #674, #65535
static TABELAdx + #675, #65535
static TABELAdx + #676, #65535
static TABELAdx + #677, #65535
static TABELAdx + #678, #65535
static TABELAdx + #679, #65535
static TABELAdx + #680, #65535
static TABELAdx + #681, #65535
static TABELAdx + #682, #65535
static TABELAdx + #683, #65535
static TABELAdx + #684, #65535
static TABELAdx + #685, #65535
static TABELAdx + #686, #65535
static TABELAdx + #687, #65535
; A = 43
static TABELAdx + #688, #65535
static TABELAdx + #689, #65535
static TABELAdx + #690, #65535
static TABELAdx + #691, #65535
static TABELAdx + #692, #65535
static TABELAdx + #693, #65535
static TABELAdx + #694, #65535
static TABELAdx + #695, #65535
static TABELAdx + #696, #65535
static TABELAdx + #697, #65535
static TABELAdx + #698, #65535
static TABELAdx + #699, #65535
static TABELAdx + #700, #65535
static TABELAdx + #701, #65535
static TABELAdx + #702, #65535
static TABELAdx + #703, #65535
; A = 44
static TABELAdx + #704, #65535
static TABELAdx + #705, #65535
static TABELAdx + #706, #65535
static TABELAdx + #707, #65535
static TABELAdx + #708, #65535
static TABELAdx + #709, #65535
static TABELAdx + #710, #65535
static TABELAdx + #711, #65535
static TABELAdx + #712, #65535
static TABELAdx + #713, #65535
static TABELAdx + #714, #65535
static TABELAdx + #715, #65535
static TABELAdx + #716, #65535
static TABELAdx + #717, #65535
static TABELAdx + #718, #65535
static TABELAdx + #719, #65535
; A = 45
static TABELAdx + #720, #65535
static TABELAdx + #721, #65535
static TABELAdx + #722, #65535
static TABELAdx + #723, #65535
static TABELAdx + #724, #65535
static TABELAdx + #725, #65535
static TABELAdx + #726, #65535
static TABELAdx + #727, #65535
static TABELAdx + #728, #65535
static TABELAdx + #729, #65535
static TABELAdx + #730, #65535
static TABELAdx + #731, #65535
static TABELAdx + #732, #65535
static TABELAdx + #733, #65535
static TABELAdx + #734, #65535
static TABELAdx + #735, #65535
; A = 46
static TABELAdx + #736, #65535
static TABELAdx + #737, #65535
static TABELAdx + #738, #65535
static TABELAdx + #739, #65535
static TABELAdx + #740, #65535
static TABELAdx + #741, #65535
static TABELAdx + #742, #65535
static TABELAdx + #743, #65535
static TABELAdx + #744, #65535
static TABELAdx + #745, #65535
static TABELAdx + #746, #65535
static TABELAdx + #747, #65535
static TABELAdx + #748, #65535
static TABELAdx + #749, #65535
static TABELAdx + #750, #65535
static TABELAdx + #751, #65535
; A = 47
static TABELAdx + #752, #65535
static TABELAdx + #753, #65535
static TABELAdx + #754, #65535
static TABELAdx + #755, #65535
static TABELAdx + #756, #65535
static TABELAdx + #757, #65535
static TABELAdx + #758, #65535
static TABELAdx + #759, #65535
static TABELAdx + #760, #65535
static TABELAdx + #761, #65535
static TABELAdx + #762, #65535
static TABELAdx + #763, #65535
static TABELAdx + #764, #65535
static TABELAdx + #765, #65535
static TABELAdx + #766, #65535
static TABELAdx + #767, #65535
; A = 48
static TABELAdx + #768, #65535
static TABELAdx + #769, #65535
static TABELAdx + #770, #65535
static TABELAdx + #771, #65535
static TABELAdx + #772, #65535
static TABELAdx + #773, #65535
static TABELAdx + #774, #65535
static TABELAdx + #775, #65535
static TABELAdx + #776, #65535
static TABELAdx + #777, #65535
static TABELAdx + #778, #65535
static TABELAdx + #779, #65535
static TABELAdx + #780, #65535
static TABELAdx + #781, #65535
static TABELAdx + #782, #65535
static TABELAdx + #783, #65535
; A = 49
static TABELAdx + #784, #65535
static TABELAdx + #785, #65535
static TABELAdx + #786, #65535
static TABELAdx + #787, #65535
static TABELAdx + #788, #65535
static TABELAdx + #789, #65535
static TABELAdx + #790, #65535
static TABELAdx + #791, #65535
static TABELAdx + #792, #65535
static TABELAdx + #793, #65535
static TABELAdx + #794, #65535
static TABELAdx + #795, #65535
static TABELAdx + #796, #65535
static TABELAdx + #797, #65535
static TABELAdx + #798, #65535
static TABELAdx + #799, #65535
; A = 50 (diagonal inferior esquerda)
static TABELAdx + #800, #65535
static TABELAdx + #801, #65535
static TABELAdx + #802, #65535
static TABELAdx + #803, #65535
static TABELAdx + #804, #65535
static TABELAdx + #805, #65535
static TABELAdx + #806, #65535
static TABELAdx + #807, #65535
static TABELAdx + #808, #65535
static TABELAdx + #809, #65535
static TABELAdx + #810, #65535
static TABELAdx + #811, #65535
static TABELAdx + #812, #65535
static TABELAdx + #813, #65535
static TABELAdx + #814, #65535
static TABELAdx + #815, #65535
; A = 51
static TABELAdx + #816, #65535
static TABELAdx + #817, #65535
static TABELAdx + #818, #0
static TABELAdx + #819, #65535
static TABELAdx + #820, #65535
static TABELAdx + #821, #65535
static TABELAdx + #822, #65535
static TABELAdx + #823, #65535
static TABELAdx + #824, #65535
static TABELAdx + #825, #0
static TABELAdx + #826, #65535
static TABELAdx + #827, #65535
static TABELAdx + #828, #65535
static TABELAdx + #829, #65535
static TABELAdx + #830, #65535
static TABELAdx + #831, #65535
; A = 52
static TABELAdx + #832, #65535
static TABELAdx + #833, #0
static TABELAdx + #834, #65535
static TABELAdx + #835, #65535
static TABELAdx + #836, #65535
static TABELAdx + #837, #0
static TABELAdx + #838, #65535
static TABELAdx + #839, #65535
static TABELAdx + #840, #65535
static TABELAdx + #841, #0
static TABELAdx + #842, #65535
static TABELAdx + #843, #65535
static TABELAdx + #844, #65535
static TABELAdx + #845, #0
static TABELAdx + #846, #65535
static TABELAdx + #847, #65535
; A = 53
static TABELAdx + #848, #0
static TABELAdx + #849, #65535
static TABELAdx + #850, #0
static TABELAdx + #851, #65535
static TABELAdx + #852, #65535
static TABELAdx + #853, #0
static TABELAdx + #854, #65535
static TABELAdx + #855, #0
static TABELAdx + #856, #65535
static TABELAdx + #857, #65535
static TABELAdx + #858, #0
static TABELAdx + #859, #65535
static TABELAdx + #860, #0
static TABELAdx + #861, #65535
static TABELAdx + #862, #65535
static TABELAdx + #863, #0
; A = 54
static TABELAdx + #864, #0
static TABELAdx + #865, #65535
static TABELAdx + #866, #0
static TABELAdx + #867, #65535
static TABELAdx + #868, #0
static TABELAdx + #869, #65535
static TABELAdx + #870, #0
static TABELAdx + #871, #65535
static TABELAdx + #872, #0
static TABELAdx + #873, #65535
static TABELAdx + #874, #0
static TABELAdx + #875, #65535
static TABELAdx + #876, #0
static TABELAdx + #877, #65535
static TABELAdx + #878, #0
static TABELAdx + #879, #65535
; A = 55
static TABELAdx + #880, #0
static TABELAdx + #881, #65535
static TABELAdx + #882, #0
static TABELAdx + #883, #0
static TABELAdx + #884, #65535
static TABELAdx + #885, #0
static TABELAdx + #886, #65535
static TABELAdx + #887, #0
static TABELAdx + #888, #0
static TABELAdx + #889, #65535
static TABELAdx + #890, #0
static TABELAdx + #891, #65535
static TABELAdx + #892, #0
static TABELAdx + #893, #0
static TABELAdx + #894, #65535
static TABELAdx + #895, #0
; A = 56
static TABELAdx + #896, #0
static TABELAdx + #897, #0
static TABELAdx + #898, #65535
static TABELAdx + #899, #0
static TABELAdx + #900, #0
static TABELAdx + #901, #65535
static TABELAdx + #902, #0
static TABELAdx + #903, #0
static TABELAdx + #904, #65535
static TABELAdx + #905, #0
static TABELAdx + #906, #0
static TABELAdx + #907, #65535
static TABELAdx + #908, #0
static TABELAdx + #909, #0
static TABELAdx + #910, #65535
static TABELAdx + #911, #0
; A = 57
static TABELAdx + #912, #0
static TABELAdx + #913, #0
static TABELAdx + #914, #0
static TABELAdx + #915, #65535
static TABELAdx + #916, #0
static TABELAdx + #917, #0
static TABELAdx + #918, #0
static TABELAdx + #919, #65535
static TABELAdx + #920, #0
static TABELAdx + #921, #0
static TABELAdx + #922, #0
static TABELAdx + #923, #65535
static TABELAdx + #924, #0
static TABELAdx + #925, #0
static TABELAdx + #926, #0
static TABELAdx + #927, #65535
; A = 58
static TABELAdx + #928, #0
static TABELAdx + #929, #0
static TABELAdx + #930, #0
static TABELAdx + #931, #0
static TABELAdx + #932, #65535
static TABELAdx + #933, #0
static TABELAdx + #934, #0
static TABELAdx + #935, #0
static TABELAdx + #936, #0
static TABELAdx + #937, #65535
static TABELAdx + #938, #0
static TABELAdx + #939, #0
static TABELAdx + #940, #0
static TABELAdx + #941, #0
static TABELAdx + #942, #65535
static TABELAdx + #943, #0
; A = 59
static TABELAdx + #944, #0
static TABELAdx + #945, #0
static TABELAdx + #946, #0
static TABELAdx + #947, #0
static TABELAdx + #948, #0
static TABELAdx + #949, #0
static TABELAdx + #950, #0
static TABELAdx + #951, #65535
static TABELAdx + #952, #0
static TABELAdx + #953, #0
static TABELAdx + #954, #0
static TABELAdx + #955, #0
static TABELAdx + #956, #0
static TABELAdx + #957, #0
static TABELAdx + #958, #0
static TABELAdx + #959, #65535
; A = 60
static TABELAdx + #960, #0
static TABELAdx + #961, #0
static TABELAdx + #962, #0
static TABELAdx + #963, #0
static TABELAdx + #964, #0
static TABELAdx + #965, #0
static TABELAdx + #966, #0
static TABELAdx + #967, #0
static TABELAdx + #968, #0
static TABELAdx + #969, #0
static TABELAdx + #970, #0
static TABELAdx + #971, #0
static TABELAdx + #972, #0
static TABELAdx + #973, #0
static TABELAdx + #974, #0
static TABELAdx + #975, #0
; A = 61
static TABELAdx + #976, #0
static TABELAdx + #977, #0
static TABELAdx + #978, #0
static TABELAdx + #979, #0
static TABELAdx + #980, #0
static TABELAdx + #981, #0
static TABELAdx + #982, #0
static TABELAdx + #983, #1
static TABELAdx + #984, #0
static TABELAdx + #985, #0
static TABELAdx + #986, #0
static TABELAdx + #987, #0
static TABELAdx + #988, #0
static TABELAdx + #989, #0
static TABELAdx + #990, #0
static TABELAdx + #991, #1
; A = 62
static TABELAdx + #992, #0
static TABELAdx + #993, #0
static TABELAdx + #994, #0
static TABELAdx + #995, #0
static TABELAdx + #996, #1
static TABELAdx + #997, #0
static TABELAdx + #998, #0
static TABELAdx + #999, #0
static TABELAdx + #1000, #0
static TABELAdx + #1001, #1
static TABELAdx + #1002, #0
static TABELAdx + #1003, #0
static TABELAdx + #1004, #0
static TABELAdx + #1005, #0
static TABELAdx + #1006, #1
static TABELAdx + #1007, #0
; A = 63
static TABELAdx + #1008, #0
static TABELAdx + #1009, #0
static TABELAdx + #1010, #0
static TABELAdx + #1011, #1
static TABELAdx + #1012, #0
static TABELAdx + #1013, #0
static TABELAdx + #1014, #0
static TABELAdx + #1015, #1
static TABELAdx + #1016, #0
static TABELAdx + #1017, #0
static TABELAdx + #1018, #0
static TABELAdx + #1019, #1
static TABELAdx + #1020, #0
static TABELAdx + #1021, #0
static TABELAdx + #1022, #0
static TABELAdx + #1023, #1
; A = 64
static TABELAdx + #1024, #0
static TABELAdx + #1025, #0
static TABELAdx + #1026, #1
static TABELAdx + #1027, #0
static TABELAdx + #1028, #0
static TABELAdx + #1029, #1
static TABELAdx + #1030, #0
static TABELAdx + #1031, #0
static TABELAdx + #1032, #1
static TABELAdx + #1033, #0
static TABELAdx + #1034, #0
static TABELAdx + #1035, #1
static TABELAdx + #1036, #0
static TABELAdx + #1037, #0
static TABELAdx + #1038, #1
static TABELAdx + #1039, #0
; A = 65
static TABELAdx + #1040, #0
static TABELAdx + #1041, #1
static TABELAdx + #1042, #0
static TABELAdx + #1043, #0
static TABELAdx + #1044, #1
static TABELAdx + #1045, #0
static TABELAdx + #1046, #1
static TABELAdx + #1047, #0
static TABELAdx + #1048, #0
static TABELAdx + #1049, #1
static TABELAdx + #1050, #0
static TABELAdx + #1051, #1
static TABELAdx + #1052, #0
static TABELAdx + #1053, #0
static TABELAdx + #1054, #1
static TABELAdx + #1055, #0
; A = 66
static TABELAdx + #1056, #0
static TABELAdx + #1057, #1
static TABELAdx + #1058, #0
static TABELAdx + #1059, #1
static TABELAdx + #1060, #0
static TABELAdx + #1061, #1
static TABELAdx + #1062, #0
static TABELAdx + #1063, #1
static TABELAdx + #1064, #0
static TABELAdx + #1065, #1
static TABELAdx + #1066, #0
static TABELAdx + #1067, #1
static TABELAdx + #1068, #0
static TABELAdx + #1069, #1
static TABELAdx + #1070, #0
static TABELAdx + #1071, #1
; A = 67
static TABELAdx + #1072, #0
static TABELAdx + #1073, #1
static TABELAdx + #1074, #0
static TABELAdx + #1075, #1
static TABELAdx + #1076, #1
static TABELAdx + #1077, #0
static TABELAdx + #1078, #1
static TABELAdx + #1079, #0
static TABELAdx + #1080, #1
static TABELAdx + #1081, #1
static TABELAdx + #1082, #0
static TABELAdx + #1083, #1
static TABELAdx + #1084, #0
static TABELAdx + #1085, #1
static TABELAdx + #1086, #1
static TABELAdx + #1087, #0
; A = 68
static TABELAdx + #1088, #1
static TABELAdx + #1089, #0
static TABELAdx + #1090, #1
static TABELAdx + #1091, #1
static TABELAdx + #1092, #1
static TABELAdx + #1093, #0
static TABELAdx + #1094, #1
static TABELAdx + #1095, #1
static TABELAdx + #1096, #1
static TABELAdx + #1097, #0
static TABELAdx + #1098, #1
static TABELAdx + #1099, #1
static TABELAdx + #1100, #1
static TABELAdx + #1101, #0
static TABELAdx + #1102, #1
static TABELAdx + #1103, #1
; A = 69
static TABELAdx + #1104, #1
static TABELAdx + #1105, #1
static TABELAdx + #1106, #0
static TABELAdx + #1107, #1
static TABELAdx + #1108, #1
static TABELAdx + #1109, #1
static TABELAdx + #1110, #1
static TABELAdx + #1111, #1
static TABELAdx + #1112, #1
static TABELAdx + #1113, #0
static TABELAdx + #1114, #1
static TABELAdx + #1115, #1
static TABELAdx + #1116, #1
static TABELAdx + #1117, #1
static TABELAdx + #1118, #1
static TABELAdx + #1119, #1
; A = 70 (diagonal inferior direita)
static TABELAdx + #1120, #1
static TABELAdx + #1121, #1
static TABELAdx + #1122, #1
static TABELAdx + #1123, #1
static TABELAdx + #1124, #1
static TABELAdx + #1125, #1
static TABELAdx + #1126, #1
static TABELAdx + #1127, #1
static TABELAdx + #1128, #1
static TABELAdx + #1129, #1
static TABELAdx + #1130, #1
static TABELAdx + #1131, #1
static TABELAdx + #1132, #1
static TABELAdx + #1133, #1
static TABELAdx + #1134, #1
static TABELAdx + #1135, #1
; A = 71
static TABELAdx + #1136, #1
static TABELAdx + #1137, #1
static TABELAdx + #1138, #1
static TABELAdx + #1139, #1
static TABELAdx + #1140, #1
static TABELAdx + #1141, #1
static TABELAdx + #1142, #1
static TABELAdx + #1143, #1
static TABELAdx + #1144, #1
static TABELAdx + #1145, #1
static TABELAdx + #1146, #1
static TABELAdx + #1147, #1
static TABELAdx + #1148, #1
static TABELAdx + #1149, #1
static TABELAdx + #1150, #1
static TABELAdx + #1151, #1
; A = 72
static TABELAdx + #1152, #1
static TABELAdx + #1153, #1
static TABELAdx + #1154, #1
static TABELAdx + #1155, #1
static TABELAdx + #1156, #1
static TABELAdx + #1157, #1
static TABELAdx + #1158, #1
static TABELAdx + #1159, #1
static TABELAdx + #1160, #1
static TABELAdx + #1161, #1
static TABELAdx + #1162, #1
static TABELAdx + #1163, #1
static TABELAdx + #1164, #1
static TABELAdx + #1165, #1
static TABELAdx + #1166, #1
static TABELAdx + #1167, #1
; A = 73
static TABELAdx + #1168, #1
static TABELAdx + #1169, #1
static TABELAdx + #1170, #1
static TABELAdx + #1171, #1
static TABELAdx + #1172, #1
static TABELAdx + #1173, #1
static TABELAdx + #1174, #1
static TABELAdx + #1175, #1
static TABELAdx + #1176, #1
static TABELAdx + #1177, #1
static TABELAdx + #1178, #1
static TABELAdx + #1179, #1
static TABELAdx + #1180, #1
static TABELAdx + #1181, #1
static TABELAdx + #1182, #1
static TABELAdx + #1183, #1
; A = 74
static TABELAdx + #1184, #1
static TABELAdx + #1185, #1
static TABELAdx + #1186, #1
static TABELAdx + #1187, #1
static TABELAdx + #1188, #1
static TABELAdx + #1189, #1
static TABELAdx + #1190, #1
static TABELAdx + #1191, #1
static TABELAdx + #1192, #1
static TABELAdx + #1193, #1
static TABELAdx + #1194, #1
static TABELAdx + #1195, #1
static TABELAdx + #1196, #1
static TABELAdx + #1197, #1
static TABELAdx + #1198, #1
static TABELAdx + #1199, #1
; A = 75
static TABELAdx + #1200, #1
static TABELAdx + #1201, #1
static TABELAdx + #1202, #1
static TABELAdx + #1203, #1
static TABELAdx + #1204, #1
static TABELAdx + #1205, #1
static TABELAdx + #1206, #1
static TABELAdx + #1207, #1
static TABELAdx + #1208, #1
static TABELAdx + #1209, #1
static TABELAdx + #1210, #1
static TABELAdx + #1211, #1
static TABELAdx + #1212, #1
static TABELAdx + #1213, #1
static TABELAdx + #1214, #1
static TABELAdx + #1215, #1
; A = 76
static TABELAdx + #1216, #1
static TABELAdx + #1217, #1
static TABELAdx + #1218, #1
static TABELAdx + #1219, #1
static TABELAdx + #1220, #1
static TABELAdx + #1221, #1
static TABELAdx + #1222, #1
static TABELAdx + #1223, #1
static TABELAdx + #1224, #1
static TABELAdx + #1225, #1
static TABELAdx + #1226, #1
static TABELAdx + #1227, #1
static TABELAdx + #1228, #1
static TABELAdx + #1229, #1
static TABELAdx + #1230, #1
static TABELAdx + #1231, #1
; A = 77
static TABELAdx + #1232, #1
static TABELAdx + #1233, #1
static TABELAdx + #1234, #1
static TABELAdx + #1235, #1
static TABELAdx + #1236, #1
static TABELAdx + #1237, #1
static TABELAdx + #1238, #1
static TABELAdx + #1239, #1
static TABELAdx + #1240, #1
static TABELAdx + #1241, #1
static TABELAdx + #1242, #1
static TABELAdx + #1243, #1
static TABELAdx + #1244, #1
static TABELAdx + #1245, #1
static TABELAdx + #1246, #1
static TABELAdx + #1247, #1
; A = 78
static TABELAdx + #1248, #1
static TABELAdx + #1249, #1
static TABELAdx + #1250, #1
static TABELAdx + #1251, #1
static TABELAdx + #1252, #1
static TABELAdx + #1253, #1
static TABELAdx + #1254, #1
static TABELAdx + #1255, #1
static TABELAdx + #1256, #1
static TABELAdx + #1257, #1
static TABELAdx + #1258, #1
static TABELAdx + #1259, #1
static TABELAdx + #1260, #1
static TABELAdx + #1261, #1
static TABELAdx + #1262, #1
static TABELAdx + #1263, #1
; A = 79
static TABELAdx + #1264, #1
static TABELAdx + #1265, #1
static TABELAdx + #1266, #1
static TABELAdx + #1267, #1
static TABELAdx + #1268, #1
static TABELAdx + #1269, #1
static TABELAdx + #1270, #1
static TABELAdx + #1271, #1
static TABELAdx + #1272, #1
static TABELAdx + #1273, #1
static TABELAdx + #1274, #1
static TABELAdx + #1275, #1
static TABELAdx + #1276, #1
static TABELAdx + #1277, #1
static TABELAdx + #1278, #1
static TABELAdx + #1279, #1

TABELAdy: var #1280
; A = 0
static TABELAdy + #0, #0
static TABELAdy + #1, #0
static TABELAdy + #2, #0
static TABELAdy + #3, #0
static TABELAdy + #4, #0
static TABELAdy + #5, #0
static TABELAdy + #6, #0
static TABELAdy + #7, #0
static TABELAdy + #8, #0
static TABELAdy + #9, #0
static TABELAdy + #10, #0
static TABELAdy + #11, #0
static TABELAdy + #12, #0
static TABELAdy + #13, #0
static TABELAdy + #14, #0
static TABELAdy + #15, #0
; A = 1
static TABELAdy + #16, #0
static TABELAdy + #17, #0
static TABELAdy + #18, #0
static TABELAdy + #19, #0
static TABELAdy + #20, #0
static TABELAdy + #21, #0
static TABELAdy + #22, #0
static TABELAdy + #23, #1
static TABELAdy + #24, #0
static TABELAdy + #25, #0
static TABELAdy + #26, #0
static TABELAdy + #27, #0
static TABELAdy + #28, #0
static TABELAdy + #29, #0
static TABELAdy + #30, #0
static TABELAdy + #31, #1
; A = 2
static TABELAdy + #32, #0
static TABELAdy + #33, #0
static TABELAdy + #34, #0
static TABELAdy + #35, #0
static TABELAdy + #36, #1
static TABELAdy + #37, #0
static TABELAdy + #38, #0
static TABELAdy + #39, #0
static TABELAdy + #40, #0
static TABELAdy + #41, #1
static TABELAdy + #42, #0
static TABELAdy + #43, #0
static TABELAdy + #44, #0
static TABELAdy + #45, #0
static TABELAdy + #46, #1
static TABELAdy + #47, #0
; A = 3
static TABELAdy + #48, #0
static TABELAdy + #49, #0
static TABELAdy + #50, #0
static TABELAdy + #51, #1
static TABELAdy + #52, #0
static TABELAdy + #53, #0
static TABELAdy + #54, #0
static TABELAdy + #55, #1
static TABELAdy + #56, #0
static TABELAdy + #57, #0
static TABELAdy + #58, #0
static TABELAdy + #59, #1
static TABELAdy + #60, #0
static TABELAdy + #61, #0
static TABELAdy + #62, #0
static TABELAdy + #63, #1
; A = 4
static TABELAdy + #64, #0
static TABELAdy + #65, #0
static TABELAdy + #66, #1
static TABELAdy + #67, #0
static TABELAdy + #68, #0
static TABELAdy + #69, #1
static TABELAdy + #70, #0
static TABELAdy + #71, #0
static TABELAdy + #72, #1
static TABELAdy + #73, #0
static TABELAdy + #74, #0
static TABELAdy + #75, #1
static TABELAdy + #76, #0
static TABELAdy + #77, #0
static TABELAdy + #78, #1
static TABELAdy + #79, #0
; A = 5
static TABELAdy + #80, #0
static TABELAdy + #81, #1
static TABELAdy + #82, #0
static TABELAdy + #83, #0
static TABELAdy + #84, #1
static TABELAdy + #85, #0
static TABELAdy + #86, #1
static TABELAdy + #87, #0
static TABELAdy + #88, #0
static TABELAdy + #89, #1
static TABELAdy + #90, #0
static TABELAdy + #91, #1
static TABELAdy + #92, #0
static TABELAdy + #93, #0
static TABELAdy + #94, #1
static TABELAdy + #95, #0
; A = 6
static TABELAdy + #96, #0
static TABELAdy + #97, #1
static TABELAdy + #98, #0
static TABELAdy + #99, #1
static TABELAdy + #100, #0
static TABELAdy + #101, #1
static TABELAdy + #102, #0
static TABELAdy + #103, #1
static TABELAdy + #104, #0
static TABELAdy + #105, #1
static TABELAdy + #106, #0
static TABELAdy + #107, #1
static TABELAdy + #108, #0
static TABELAdy + #109, #1
static TABELAdy + #110, #0
static TABELAdy + #111, #1
; A = 7
static TABELAdy + #112, #0
static TABELAdy + #113, #1
static TABELAdy + #114, #0
static TABELAdy + #115, #1
static TABELAdy + #116, #1
static TABELAdy + #117, #0
static TABELAdy + #118, #1
static TABELAdy + #119, #0
static TABELAdy + #120, #1
static TABELAdy + #121, #1
static TABELAdy + #122, #0
static TABELAdy + #123, #1
static TABELAdy + #124, #0
static TABELAdy + #125, #1
static TABELAdy + #126, #1
static TABELAdy + #127, #0
; A = 8
static TABELAdy + #128, #1
static TABELAdy + #129, #0
static TABELAdy + #130, #1
static TABELAdy + #131, #1
static TABELAdy + #132, #1
static TABELAdy + #133, #0
static TABELAdy + #134, #1
static TABELAdy + #135, #1
static TABELAdy + #136, #1
static TABELAdy + #137, #0
static TABELAdy + #138, #1
static TABELAdy + #139, #1
static TABELAdy + #140, #1
static TABELAdy + #141, #0
static TABELAdy + #142, #1
static TABELAdy + #143, #1
; A = 9
static TABELAdy + #144, #1
static TABELAdy + #145, #1
static TABELAdy + #146, #0
static TABELAdy + #147, #1
static TABELAdy + #148, #1
static TABELAdy + #149, #1
static TABELAdy + #150, #1
static TABELAdy + #151, #1
static TABELAdy + #152, #1
static TABELAdy + #153, #0
static TABELAdy + #154, #1
static TABELAdy + #155, #1
static TABELAdy + #156, #1
static TABELAdy + #157, #1
static TABELAdy + #158, #1
static TABELAdy + #159, #1
; A = 10
static TABELAdy + #160, #1
static TABELAdy + #161, #1
static TABELAdy + #162, #1
static TABELAdy + #163, #1
static TABELAdy + #164, #1
static TABELAdy + #165, #1
static TABELAdy + #166, #1
static TABELAdy + #167, #1
static TABELAdy + #168, #1
static TABELAdy + #169, #1
static TABELAdy + #170, #1
static TABELAdy + #171, #1
static TABELAdy + #172, #1
static TABELAdy + #173, #1
static TABELAdy + #174, #1
static TABELAdy + #175, #1
; A = 11
static TABELAdy + #176, #1
static TABELAdy + #177, #1
static TABELAdy + #178, #1
static TABELAdy + #179, #1
static TABELAdy + #180, #1
static TABELAdy + #181, #1
static TABELAdy + #182, #1
static TABELAdy + #183, #1
static TABELAdy + #184, #1
static TABELAdy + #185, #1
static TABELAdy + #186, #1
static TABELAdy + #187, #1
static TABELAdy + #188, #1
static TABELAdy + #189, #1
static TABELAdy + #190, #1
static TABELAdy + #191, #1
; A = 12
static TABELAdy + #192, #1
static TABELAdy + #193, #1
static TABELAdy + #194, #1
static TABELAdy + #195, #1
static TABELAdy + #196, #1
static TABELAdy + #197, #1
static TABELAdy + #198, #1
static TABELAdy + #199, #1
static TABELAdy + #200, #1
static TABELAdy + #201, #1
static TABELAdy + #202, #1
static TABELAdy + #203, #1
static TABELAdy + #204, #1
static TABELAdy + #205, #1
static TABELAdy + #206, #1
static TABELAdy + #207, #1
; A = 13
static TABELAdy + #208, #1
static TABELAdy + #209, #1
static TABELAdy + #210, #1
static TABELAdy + #211, #1
static TABELAdy + #212, #1
static TABELAdy + #213, #1
static TABELAdy + #214, #1
static TABELAdy + #215, #1
static TABELAdy + #216, #1
static TABELAdy + #217, #1
static TABELAdy + #218, #1
static TABELAdy + #219, #1
static TABELAdy + #220, #1
static TABELAdy + #221, #1
static TABELAdy + #222, #1
static TABELAdy + #223, #1
; A = 14
static TABELAdy + #224, #1
static TABELAdy + #225, #1
static TABELAdy + #226, #1
static TABELAdy + #227, #1
static TABELAdy + #228, #1
static TABELAdy + #229, #1
static TABELAdy + #230, #1
static TABELAdy + #231, #1
static TABELAdy + #232, #1
static TABELAdy + #233, #1
static TABELAdy + #234, #1
static TABELAdy + #235, #1
static TABELAdy + #236, #1
static TABELAdy + #237, #1
static TABELAdy + #238, #1
static TABELAdy + #239, #1
; A = 15
static TABELAdy + #240, #1
static TABELAdy + #241, #1
static TABELAdy + #242, #1
static TABELAdy + #243, #1
static TABELAdy + #244, #1
static TABELAdy + #245, #1
static TABELAdy + #246, #1
static TABELAdy + #247, #1
static TABELAdy + #248, #1
static TABELAdy + #249, #1
static TABELAdy + #250, #1
static TABELAdy + #251, #1
static TABELAdy + #252, #1
static TABELAdy + #253, #1
static TABELAdy + #254, #1
static TABELAdy + #255, #1
; A = 16
static TABELAdy + #256, #1
static TABELAdy + #257, #1
static TABELAdy + #258, #1
static TABELAdy + #259, #1
static TABELAdy + #260, #1
static TABELAdy + #261, #1
static TABELAdy + #262, #1
static TABELAdy + #263, #1
static TABELAdy + #264, #1
static TABELAdy + #265, #1
static TABELAdy + #266, #1
static TABELAdy + #267, #1
static TABELAdy + #268, #1
static TABELAdy + #269, #1
static TABELAdy + #270, #1
static TABELAdy + #271, #1
; A = 17
static TABELAdy + #272, #1
static TABELAdy + #273, #1
static TABELAdy + #274, #1
static TABELAdy + #275, #1
static TABELAdy + #276, #1
static TABELAdy + #277, #1
static TABELAdy + #278, #1
static TABELAdy + #279, #1
static TABELAdy + #280, #1
static TABELAdy + #281, #1
static TABELAdy + #282, #1
static TABELAdy + #283, #1
static TABELAdy + #284, #1
static TABELAdy + #285, #1
static TABELAdy + #286, #1
static TABELAdy + #287, #1
; A = 18
static TABELAdy + #288, #1
static TABELAdy + #289, #1
static TABELAdy + #290, #1
static TABELAdy + #291, #1
static TABELAdy + #292, #1
static TABELAdy + #293, #1
static TABELAdy + #294, #1
static TABELAdy + #295, #1
static TABELAdy + #296, #1
static TABELAdy + #297, #1
static TABELAdy + #298, #1
static TABELAdy + #299, #1
static TABELAdy + #300, #1
static TABELAdy + #301, #1
static TABELAdy + #302, #1
static TABELAdy + #303, #1
; A = 19
static TABELAdy + #304, #1
static TABELAdy + #305, #1
static TABELAdy + #306, #1
static TABELAdy + #307, #1
static TABELAdy + #308, #1
static TABELAdy + #309, #1
static TABELAdy + #310, #1
static TABELAdy + #311, #1
static TABELAdy + #312, #1
static TABELAdy + #313, #1
static TABELAdy + #314, #1
static TABELAdy + #315, #1
static TABELAdy + #316, #1
static TABELAdy + #317, #1
static TABELAdy + #318, #1
static TABELAdy + #319, #1
; A = 20
static TABELAdy + #320, #1
static TABELAdy + #321, #1
static TABELAdy + #322, #1
static TABELAdy + #323, #1
static TABELAdy + #324, #1
static TABELAdy + #325, #1
static TABELAdy + #326, #1
static TABELAdy + #327, #1
static TABELAdy + #328, #1
static TABELAdy + #329, #1
static TABELAdy + #330, #1
static TABELAdy + #331, #1
static TABELAdy + #332, #1
static TABELAdy + #333, #1
static TABELAdy + #334, #1
static TABELAdy + #335, #1
; A = 21
static TABELAdy + #336, #1
static TABELAdy + #337, #1
static TABELAdy + #338, #1
static TABELAdy + #339, #1
static TABELAdy + #340, #1
static TABELAdy + #341, #1
static TABELAdy + #342, #1
static TABELAdy + #343, #1
static TABELAdy + #344, #1
static TABELAdy + #345, #1
static TABELAdy + #346, #1
static TABELAdy + #347, #1
static TABELAdy + #348, #1
static TABELAdy + #349, #1
static TABELAdy + #350, #1
static TABELAdy + #351, #1
; A = 22
static TABELAdy + #352, #1
static TABELAdy + #353, #1
static TABELAdy + #354, #1
static TABELAdy + #355, #1
static TABELAdy + #356, #1
static TABELAdy + #357, #1
static TABELAdy + #358, #1
static TABELAdy + #359, #1
static TABELAdy + #360, #1
static TABELAdy + #361, #1
static TABELAdy + #362, #1
static TABELAdy + #363, #1
static TABELAdy + #364, #1
static TABELAdy + #365, #1
static TABELAdy + #366, #1
static TABELAdy + #367, #1
; A = 23
static TABELAdy + #368, #1
static TABELAdy + #369, #1
static TABELAdy + #370, #1
static TABELAdy + #371, #1
static TABELAdy + #372, #1
static TABELAdy + #373, #1
static TABELAdy + #374, #1
static TABELAdy + #375, #1
static TABELAdy + #376, #1
static TABELAdy + #377, #1
static TABELAdy + #378, #1
static TABELAdy + #379, #1
static TABELAdy + #380, #1
static TABELAdy + #381, #1
static TABELAdy + #382, #1
static TABELAdy + #383, #1
; A = 24
static TABELAdy + #384, #1
static TABELAdy + #385, #1
static TABELAdy + #386, #1
static TABELAdy + #387, #1
static TABELAdy + #388, #1
static TABELAdy + #389, #1
static TABELAdy + #390, #1
static TABELAdy + #391, #1
static TABELAdy + #392, #1
static TABELAdy + #393, #1
static TABELAdy + #394, #1
static TABELAdy + #395, #1
static TABELAdy + #396, #1
static TABELAdy + #397, #1
static TABELAdy + #398, #1
static TABELAdy + #399, #1
; A = 25
static TABELAdy + #400, #1
static TABELAdy + #401, #1
static TABELAdy + #402, #1
static TABELAdy + #403, #1
static TABELAdy + #404, #1
static TABELAdy + #405, #1
static TABELAdy + #406, #1
static TABELAdy + #407, #1
static TABELAdy + #408, #1
static TABELAdy + #409, #1
static TABELAdy + #410, #1
static TABELAdy + #411, #1
static TABELAdy + #412, #1
static TABELAdy + #413, #1
static TABELAdy + #414, #1
static TABELAdy + #415, #1
; A = 26
static TABELAdy + #416, #1
static TABELAdy + #417, #1
static TABELAdy + #418, #1
static TABELAdy + #419, #1
static TABELAdy + #420, #1
static TABELAdy + #421, #1
static TABELAdy + #422, #1
static TABELAdy + #423, #1
static TABELAdy + #424, #1
static TABELAdy + #425, #1
static TABELAdy + #426, #1
static TABELAdy + #427, #1
static TABELAdy + #428, #1
static TABELAdy + #429, #1
static TABELAdy + #430, #1
static TABELAdy + #431, #1
; A = 27
static TABELAdy + #432, #1
static TABELAdy + #433, #1
static TABELAdy + #434, #1
static TABELAdy + #435, #1
static TABELAdy + #436, #1
static TABELAdy + #437, #1
static TABELAdy + #438, #1
static TABELAdy + #439, #1
static TABELAdy + #440, #1
static TABELAdy + #441, #1
static TABELAdy + #442, #1
static TABELAdy + #443, #1
static TABELAdy + #444, #1
static TABELAdy + #445, #1
static TABELAdy + #446, #1
static TABELAdy + #447, #1
; A = 28
static TABELAdy + #448, #1
static TABELAdy + #449, #1
static TABELAdy + #450, #1
static TABELAdy + #451, #1
static TABELAdy + #452, #1
static TABELAdy + #453, #1
static TABELAdy + #454, #1
static TABELAdy + #455, #1
static TABELAdy + #456, #1
static TABELAdy + #457, #1
static TABELAdy + #458, #1
static TABELAdy + #459, #1
static TABELAdy + #460, #1
static TABELAdy + #461, #1
static TABELAdy + #462, #1
static TABELAdy + #463, #1
; A = 29
static TABELAdy + #464, #1
static TABELAdy + #465, #1
static TABELAdy + #466, #1
static TABELAdy + #467, #1
static TABELAdy + #468, #1
static TABELAdy + #469, #1
static TABELAdy + #470, #1
static TABELAdy + #471, #1
static TABELAdy + #472, #1
static TABELAdy + #473, #1
static TABELAdy + #474, #1
static TABELAdy + #475, #1
static TABELAdy + #476, #1
static TABELAdy + #477, #1
static TABELAdy + #478, #1
static TABELAdy + #479, #1
; A = 30 (diagonal superior esquerda)
static TABELAdy + #480, #1
static TABELAdy + #481, #1
static TABELAdy + #482, #1
static TABELAdy + #483, #1
static TABELAdy + #484, #1
static TABELAdy + #485, #1
static TABELAdy + #486, #1
static TABELAdy + #487, #1
static TABELAdy + #488, #1
static TABELAdy + #489, #1
static TABELAdy + #490, #1
static TABELAdy + #491, #1
static TABELAdy + #492, #1
static TABELAdy + #493, #1
static TABELAdy + #494, #1
static TABELAdy + #495, #1
; A = 31
static TABELAdy + #496, #1
static TABELAdy + #497, #1
static TABELAdy + #498, #0
static TABELAdy + #499, #1
static TABELAdy + #500, #1
static TABELAdy + #501, #1
static TABELAdy + #502, #1
static TABELAdy + #503, #1
static TABELAdy + #504, #1
static TABELAdy + #505, #0
static TABELAdy + #506, #1
static TABELAdy + #507, #1
static TABELAdy + #508, #1
static TABELAdy + #509, #1
static TABELAdy + #510, #1
static TABELAdy + #511, #1
; A = 32
static TABELAdy + #512, #1
static TABELAdy + #513, #0
static TABELAdy + #514, #1
static TABELAdy + #515, #1
static TABELAdy + #516, #1
static TABELAdy + #517, #0
static TABELAdy + #518, #1
static TABELAdy + #519, #1
static TABELAdy + #520, #1
static TABELAdy + #521, #0
static TABELAdy + #522, #1
static TABELAdy + #523, #1
static TABELAdy + #524, #1
static TABELAdy + #525, #0
static TABELAdy + #526, #1
static TABELAdy + #527, #1
; A = 33
static TABELAdy + #528, #0
static TABELAdy + #529, #1
static TABELAdy + #530, #0
static TABELAdy + #531, #1
static TABELAdy + #532, #1
static TABELAdy + #533, #0
static TABELAdy + #534, #1
static TABELAdy + #535, #0
static TABELAdy + #536, #1
static TABELAdy + #537, #1
static TABELAdy + #538, #0
static TABELAdy + #539, #1
static TABELAdy + #540, #0
static TABELAdy + #541, #1
static TABELAdy + #542, #1
static TABELAdy + #543, #0
; A = 34
static TABELAdy + #544, #0
static TABELAdy + #545, #1
static TABELAdy + #546, #0
static TABELAdy + #547, #1
static TABELAdy + #548, #0
static TABELAdy + #549, #1
static TABELAdy + #550, #0
static TABELAdy + #551, #1
static TABELAdy + #552, #0
static TABELAdy + #553, #1
static TABELAdy + #554, #0
static TABELAdy + #555, #1
static TABELAdy + #556, #0
static TABELAdy + #557, #1
static TABELAdy + #558, #0
static TABELAdy + #559, #1
; A = 35
static TABELAdy + #560, #0
static TABELAdy + #561, #1
static TABELAdy + #562, #0
static TABELAdy + #563, #0
static TABELAdy + #564, #1
static TABELAdy + #565, #0
static TABELAdy + #566, #1
static TABELAdy + #567, #0
static TABELAdy + #568, #0
static TABELAdy + #569, #1
static TABELAdy + #570, #0
static TABELAdy + #571, #1
static TABELAdy + #572, #0
static TABELAdy + #573, #0
static TABELAdy + #574, #1
static TABELAdy + #575, #0
; A = 36
static TABELAdy + #576, #0
static TABELAdy + #577, #0
static TABELAdy + #578, #1
static TABELAdy + #579, #0
static TABELAdy + #580, #0
static TABELAdy + #581, #1
static TABELAdy + #582, #0
static TABELAdy + #583, #0
static TABELAdy + #584, #1
static TABELAdy + #585, #0
static TABELAdy + #586, #0
static TABELAdy + #587, #1
static TABELAdy + #588, #0
static TABELAdy + #589, #0
static TABELAdy + #590, #1
static TABELAdy + #591, #0
; A = 37
static TABELAdy + #592, #0
static TABELAdy + #593, #0
static TABELAdy + #594, #0
static TABELAdy + #595, #1
static TABELAdy + #596, #0
static TABELAdy + #597, #0
static TABELAdy + #598, #0
static TABELAdy + #599, #1
static TABELAdy + #600, #0
static TABELAdy + #601, #0
static TABELAdy + #602, #0
static TABELAdy + #603, #1
static TABELAdy + #604, #0
static TABELAdy + #605, #0
static TABELAdy + #606, #0
static TABELAdy + #607, #1
; A = 38
static TABELAdy + #608, #0
static TABELAdy + #609, #0
static TABELAdy + #610, #0
static TABELAdy + #611, #0
static TABELAdy + #612, #1
static TABELAdy + #613, #0
static TABELAdy + #614, #0
static TABELAdy + #615, #0
static TABELAdy + #616, #0
static TABELAdy + #617, #1
static TABELAdy + #618, #0
static TABELAdy + #619, #0
static TABELAdy + #620, #0
static TABELAdy + #621, #0
static TABELAdy + #622, #1
static TABELAdy + #623, #0
; A = 39
static TABELAdy + #624, #0
static TABELAdy + #625, #0
static TABELAdy + #626, #0
static TABELAdy + #627, #0
static TABELAdy + #628, #0
static TABELAdy + #629, #0
static TABELAdy + #630, #0
static TABELAdy + #631, #1
static TABELAdy + #632, #0
static TABELAdy + #633, #0
static TABELAdy + #634, #0
static TABELAdy + #635, #0
static TABELAdy + #636, #0
static TABELAdy + #637, #0
static TABELAdy + #638, #0
static TABELAdy + #639, #1
; A = 40
static TABELAdy + #640, #0
static TABELAdy + #641, #0
static TABELAdy + #642, #0
static TABELAdy + #643, #0
static TABELAdy + #644, #0
static TABELAdy + #645, #0
static TABELAdy + #646, #0
static TABELAdy + #647, #0
static TABELAdy + #648, #0
static TABELAdy + #649, #0
static TABELAdy + #650, #0
static TABELAdy + #651, #0
static TABELAdy + #652, #0
static TABELAdy + #653, #0
static TABELAdy + #654, #0
static TABELAdy + #655, #0
; A = 41
static TABELAdy + #656, #0
static TABELAdy + #657, #0
static TABELAdy + #658, #0
static TABELAdy + #659, #0
static TABELAdy + #660, #0
static TABELAdy + #661, #0
static TABELAdy + #662, #0
static TABELAdy + #663, #65535
static TABELAdy + #664, #0
static TABELAdy + #665, #0
static TABELAdy + #666, #0
static TABELAdy + #667, #0
static TABELAdy + #668, #0
static TABELAdy + #669, #0
static TABELAdy + #670, #0
static TABELAdy + #671, #65535
; A = 42
static TABELAdy + #672, #0
static TABELAdy + #673, #0
static TABELAdy + #674, #0
static TABELAdy + #675, #0
static TABELAdy + #676, #65535
static TABELAdy + #677, #0
static TABELAdy + #678, #0
static TABELAdy + #679, #0
static TABELAdy + #680, #0
static TABELAdy + #681, #65535
static TABELAdy + #682, #0
static TABELAdy + #683, #0
static TABELAdy + #684, #0
static TABELAdy + #685, #0
static TABELAdy + #686, #65535
static TABELAdy + #687, #0
; A = 43
static TABELAdy + #688, #0
static TABELAdy + #689, #0
static TABELAdy + #690, #0
static TABELAdy + #691, #65535
static TABELAdy + #692, #0
static TABELAdy + #693, #0
static TABELAdy + #694, #0
static TABELAdy + #695, #65535
static TABELAdy + #696, #0
static TABELAdy + #697, #0
static TABELAdy + #698, #0
static TABELAdy + #699, #65535
static TABELAdy + #700, #0
static TABELAdy + #701, #0
static TABELAdy + #702, #0
static TABELAdy + #703, #65535
; A = 44
static TABELAdy + #704, #0
static TABELAdy + #705, #0
static TABELAdy + #706, #65535
static TABELAdy + #707, #0
static TABELAdy + #708, #0
static TABELAdy + #709, #65535
static TABELAdy + #710, #0
static TABELAdy + #711, #0
static TABELAdy + #712, #65535
static TABELAdy + #713, #0
static TABELAdy + #714, #0
static TABELAdy + #715, #65535
static TABELAdy + #716, #0
static TABELAdy + #717, #0
static TABELAdy + #718, #65535
static TABELAdy + #719, #0
; A = 45
static TABELAdy + #720, #0
static TABELAdy + #721, #65535
static TABELAdy + #722, #0
static TABELAdy + #723, #0
static TABELAdy + #724, #65535
static TABELAdy + #725, #0
static TABELAdy + #726, #65535
static TABELAdy + #727, #0
static TABELAdy + #728, #0
static TABELAdy + #729, #65535
static TABELAdy + #730, #0
static TABELAdy + #731, #65535
static TABELAdy + #732, #0
static TABELAdy + #733, #0
static TABELAdy + #734, #65535
static TABELAdy + #735, #0
; A = 46
static TABELAdy + #736, #0
static TABELAdy + #737, #65535
static TABELAdy + #738, #0
static TABELAdy + #739, #65535
static TABELAdy + #740, #0
static TABELAdy + #741, #65535
static TABELAdy + #742, #0
static TABELAdy + #743, #65535
static TABELAdy + #744, #0
static TABELAdy + #745, #65535
static TABELAdy + #746, #0
static TABELAdy + #747, #65535
static TABELAdy + #748, #0
static TABELAdy + #749, #65535
static TABELAdy + #750, #0
static TABELAdy + #751, #65535
; A = 47
static TABELAdy + #752, #0
static TABELAdy + #753, #65535
static TABELAdy + #754, #0
static TABELAdy + #755, #65535
static TABELAdy + #756, #65535
static TABELAdy + #757, #0
static TABELAdy + #758, #65535
static TABELAdy + #759, #0
static TABELAdy + #760, #65535
static TABELAdy + #761, #65535
static TABELAdy + #762, #0
static TABELAdy + #763, #65535
static TABELAdy + #764, #0
static TABELAdy + #765, #65535
static TABELAdy + #766, #65535
static TABELAdy + #767, #0
; A = 48
static TABELAdy + #768, #65535
static TABELAdy + #769, #0
static TABELAdy + #770, #65535
static TABELAdy + #771, #65535
static TABELAdy + #772, #65535
static TABELAdy + #773, #0
static TABELAdy + #774, #65535
static TABELAdy + #775, #65535
static TABELAdy + #776, #65535
static TABELAdy + #777, #0
static TABELAdy + #778, #65535
static TABELAdy + #779, #65535
static TABELAdy + #780, #65535
static TABELAdy + #781, #0
static TABELAdy + #782, #65535
static TABELAdy + #783, #65535
; A = 49
static TABELAdy + #784, #65535
static TABELAdy + #785, #65535
static TABELAdy + #786, #0
static TABELAdy + #787, #65535
static TABELAdy + #788, #65535
static TABELAdy + #789, #65535
static TABELAdy + #790, #65535
static TABELAdy + #791, #65535
static TABELAdy + #792, #65535
static TABELAdy + #793, #0
static TABELAdy + #794, #65535
static TABELAdy + #795, #65535
static TABELAdy + #796, #65535
static TABELAdy + #797, #65535
static TABELAdy + #798, #65535
static TABELAdy + #799, #65535
; A = 50 (diagonal inferior esquerda)
static TABELAdy + #800, #65535
static TABELAdy + #801, #65535
static TABELAdy + #802, #65535
static TABELAdy + #803, #65535
static TABELAdy + #804, #65535
static TABELAdy + #805, #65535
static TABELAdy + #806, #65535
static TABELAdy + #807, #65535
static TABELAdy + #808, #65535
static TABELAdy + #809, #65535
static TABELAdy + #810, #65535
static TABELAdy + #811, #65535
static TABELAdy + #812, #65535
static TABELAdy + #813, #65535
static TABELAdy + #814, #65535
static TABELAdy + #815, #65535
; A = 51
static TABELAdy + #816, #65535
static TABELAdy + #817, #65535
static TABELAdy + #818, #65535
static TABELAdy + #819, #65535
static TABELAdy + #820, #65535
static TABELAdy + #821, #65535
static TABELAdy + #822, #65535
static TABELAdy + #823, #65535
static TABELAdy + #824, #65535
static TABELAdy + #825, #65535
static TABELAdy + #826, #65535
static TABELAdy + #827, #65535
static TABELAdy + #828, #65535
static TABELAdy + #829, #65535
static TABELAdy + #830, #65535
static TABELAdy + #831, #65535
; A = 52
static TABELAdy + #832, #65535
static TABELAdy + #833, #65535
static TABELAdy + #834, #65535
static TABELAdy + #835, #65535
static TABELAdy + #836, #65535
static TABELAdy + #837, #65535
static TABELAdy + #838, #65535
static TABELAdy + #839, #65535
static TABELAdy + #840, #65535
static TABELAdy + #841, #65535
static TABELAdy + #842, #65535
static TABELAdy + #843, #65535
static TABELAdy + #844, #65535
static TABELAdy + #845, #65535
static TABELAdy + #846, #65535
static TABELAdy + #847, #65535
; A = 53
static TABELAdy + #848, #65535
static TABELAdy + #849, #65535
static TABELAdy + #850, #65535
static TABELAdy + #851, #65535
static TABELAdy + #852, #65535
static TABELAdy + #853, #65535
static TABELAdy + #854, #65535
static TABELAdy + #855, #65535
static TABELAdy + #856, #65535
static TABELAdy + #857, #65535
static TABELAdy + #858, #65535
static TABELAdy + #859, #65535
static TABELAdy + #860, #65535
static TABELAdy + #861, #65535
static TABELAdy + #862, #65535
static TABELAdy + #863, #65535
; A = 54
static TABELAdy + #864, #65535
static TABELAdy + #865, #65535
static TABELAdy + #866, #65535
static TABELAdy + #867, #65535
static TABELAdy + #868, #65535
static TABELAdy + #869, #65535
static TABELAdy + #870, #65535
static TABELAdy + #871, #65535
static TABELAdy + #872, #65535
static TABELAdy + #873, #65535
static TABELAdy + #874, #65535
static TABELAdy + #875, #65535
static TABELAdy + #876, #65535
static TABELAdy + #877, #65535
static TABELAdy + #878, #65535
static TABELAdy + #879, #65535
; A = 55
static TABELAdy + #880, #65535
static TABELAdy + #881, #65535
static TABELAdy + #882, #65535
static TABELAdy + #883, #65535
static TABELAdy + #884, #65535
static TABELAdy + #885, #65535
static TABELAdy + #886, #65535
static TABELAdy + #887, #65535
static TABELAdy + #888, #65535
static TABELAdy + #889, #65535
static TABELAdy + #890, #65535
static TABELAdy + #891, #65535
static TABELAdy + #892, #65535
static TABELAdy + #893, #65535
static TABELAdy + #894, #65535
static TABELAdy + #895, #65535
; A = 56
static TABELAdy + #896, #65535
static TABELAdy + #897, #65535
static TABELAdy + #898, #65535
static TABELAdy + #899, #65535
static TABELAdy + #900, #65535
static TABELAdy + #901, #65535
static TABELAdy + #902, #65535
static TABELAdy + #903, #65535
static TABELAdy + #904, #65535
static TABELAdy + #905, #65535
static TABELAdy + #906, #65535
static TABELAdy + #907, #65535
static TABELAdy + #908, #65535
static TABELAdy + #909, #65535
static TABELAdy + #910, #65535
static TABELAdy + #911, #65535
; A = 57
static TABELAdy + #912, #65535
static TABELAdy + #913, #65535
static TABELAdy + #914, #65535
static TABELAdy + #915, #65535
static TABELAdy + #916, #65535
static TABELAdy + #917, #65535
static TABELAdy + #918, #65535
static TABELAdy + #919, #65535
static TABELAdy + #920, #65535
static TABELAdy + #921, #65535
static TABELAdy + #922, #65535
static TABELAdy + #923, #65535
static TABELAdy + #924, #65535
static TABELAdy + #925, #65535
static TABELAdy + #926, #65535
static TABELAdy + #927, #65535
; A = 58
static TABELAdy + #928, #65535
static TABELAdy + #929, #65535
static TABELAdy + #930, #65535
static TABELAdy + #931, #65535
static TABELAdy + #932, #65535
static TABELAdy + #933, #65535
static TABELAdy + #934, #65535
static TABELAdy + #935, #65535
static TABELAdy + #936, #65535
static TABELAdy + #937, #65535
static TABELAdy + #938, #65535
static TABELAdy + #939, #65535
static TABELAdy + #940, #65535
static TABELAdy + #941, #65535
static TABELAdy + #942, #65535
static TABELAdy + #943, #65535
; A = 59
static TABELAdy + #944, #65535
static TABELAdy + #945, #65535
static TABELAdy + #946, #65535
static TABELAdy + #947, #65535
static TABELAdy + #948, #65535
static TABELAdy + #949, #65535
static TABELAdy + #950, #65535
static TABELAdy + #951, #65535
static TABELAdy + #952, #65535
static TABELAdy + #953, #65535
static TABELAdy + #954, #65535
static TABELAdy + #955, #65535
static TABELAdy + #956, #65535
static TABELAdy + #957, #65535
static TABELAdy + #958, #65535
static TABELAdy + #959, #65535
; A = 60
static TABELAdy + #960, #65535
static TABELAdy + #961, #65535
static TABELAdy + #962, #65535
static TABELAdy + #963, #65535
static TABELAdy + #964, #65535
static TABELAdy + #965, #65535
static TABELAdy + #966, #65535
static TABELAdy + #967, #65535
static TABELAdy + #968, #65535
static TABELAdy + #969, #65535
static TABELAdy + #970, #65535
static TABELAdy + #971, #65535
static TABELAdy + #972, #65535
static TABELAdy + #973, #65535
static TABELAdy + #974, #65535
static TABELAdy + #975, #65535
; A = 61
static TABELAdy + #976, #65535
static TABELAdy + #977, #65535
static TABELAdy + #978, #65535
static TABELAdy + #979, #65535
static TABELAdy + #980, #65535
static TABELAdy + #981, #65535
static TABELAdy + #982, #65535
static TABELAdy + #983, #65535
static TABELAdy + #984, #65535
static TABELAdy + #985, #65535
static TABELAdy + #986, #65535
static TABELAdy + #987, #65535
static TABELAdy + #988, #65535
static TABELAdy + #989, #65535
static TABELAdy + #990, #65535
static TABELAdy + #991, #65535
; A = 62
static TABELAdy + #992, #65535
static TABELAdy + #993, #65535
static TABELAdy + #994, #65535
static TABELAdy + #995, #65535
static TABELAdy + #996, #65535
static TABELAdy + #997, #65535
static TABELAdy + #998, #65535
static TABELAdy + #999, #65535
static TABELAdy + #1000, #65535
static TABELAdy + #1001, #65535
static TABELAdy + #1002, #65535
static TABELAdy + #1003, #65535
static TABELAdy + #1004, #65535
static TABELAdy + #1005, #65535
static TABELAdy + #1006, #65535
static TABELAdy + #1007, #65535
; A = 63
static TABELAdy + #1008, #65535
static TABELAdy + #1009, #65535
static TABELAdy + #1010, #65535
static TABELAdy + #1011, #65535
static TABELAdy + #1012, #65535
static TABELAdy + #1013, #65535
static TABELAdy + #1014, #65535
static TABELAdy + #1015, #65535
static TABELAdy + #1016, #65535
static TABELAdy + #1017, #65535
static TABELAdy + #1018, #65535
static TABELAdy + #1019, #65535
static TABELAdy + #1020, #65535
static TABELAdy + #1021, #65535
static TABELAdy + #1022, #65535
static TABELAdy + #1023, #65535
; A = 64
static TABELAdy + #1024, #65535
static TABELAdy + #1025, #65535
static TABELAdy + #1026, #65535
static TABELAdy + #1027, #65535
static TABELAdy + #1028, #65535
static TABELAdy + #1029, #65535
static TABELAdy + #1030, #65535
static TABELAdy + #1031, #65535
static TABELAdy + #1032, #65535
static TABELAdy + #1033, #65535
static TABELAdy + #1034, #65535
static TABELAdy + #1035, #65535
static TABELAdy + #1036, #65535
static TABELAdy + #1037, #65535
static TABELAdy + #1038, #65535
static TABELAdy + #1039, #65535
; A = 65
static TABELAdy + #1040, #65535
static TABELAdy + #1041, #65535
static TABELAdy + #1042, #65535
static TABELAdy + #1043, #65535
static TABELAdy + #1044, #65535
static TABELAdy + #1045, #65535
static TABELAdy + #1046, #65535
static TABELAdy + #1047, #65535
static TABELAdy + #1048, #65535
static TABELAdy + #1049, #65535
static TABELAdy + #1050, #65535
static TABELAdy + #1051, #65535
static TABELAdy + #1052, #65535
static TABELAdy + #1053, #65535
static TABELAdy + #1054, #65535
static TABELAdy + #1055, #65535
; A = 66
static TABELAdy + #1056, #65535
static TABELAdy + #1057, #65535
static TABELAdy + #1058, #65535
static TABELAdy + #1059, #65535
static TABELAdy + #1060, #65535
static TABELAdy + #1061, #65535
static TABELAdy + #1062, #65535
static TABELAdy + #1063, #65535
static TABELAdy + #1064, #65535
static TABELAdy + #1065, #65535
static TABELAdy + #1066, #65535
static TABELAdy + #1067, #65535
static TABELAdy + #1068, #65535
static TABELAdy + #1069, #65535
static TABELAdy + #1070, #65535
static TABELAdy + #1071, #65535
; A = 67
static TABELAdy + #1072, #65535
static TABELAdy + #1073, #65535
static TABELAdy + #1074, #65535
static TABELAdy + #1075, #65535
static TABELAdy + #1076, #65535
static TABELAdy + #1077, #65535
static TABELAdy + #1078, #65535
static TABELAdy + #1079, #65535
static TABELAdy + #1080, #65535
static TABELAdy + #1081, #65535
static TABELAdy + #1082, #65535
static TABELAdy + #1083, #65535
static TABELAdy + #1084, #65535
static TABELAdy + #1085, #65535
static TABELAdy + #1086, #65535
static TABELAdy + #1087, #65535
; A = 68
static TABELAdy + #1088, #65535
static TABELAdy + #1089, #65535
static TABELAdy + #1090, #65535
static TABELAdy + #1091, #65535
static TABELAdy + #1092, #65535
static TABELAdy + #1093, #65535
static TABELAdy + #1094, #65535
static TABELAdy + #1095, #65535
static TABELAdy + #1096, #65535
static TABELAdy + #1097, #65535
static TABELAdy + #1098, #65535
static TABELAdy + #1099, #65535
static TABELAdy + #1100, #65535
static TABELAdy + #1101, #65535
static TABELAdy + #1102, #65535
static TABELAdy + #1103, #65535
; A = 69
static TABELAdy + #1104, #65535
static TABELAdy + #1105, #65535
static TABELAdy + #1106, #65535
static TABELAdy + #1107, #65535
static TABELAdy + #1108, #65535
static TABELAdy + #1109, #65535
static TABELAdy + #1110, #65535
static TABELAdy + #1111, #65535
static TABELAdy + #1112, #65535
static TABELAdy + #1113, #65535
static TABELAdy + #1114, #65535
static TABELAdy + #1115, #65535
static TABELAdy + #1116, #65535
static TABELAdy + #1117, #65535
static TABELAdy + #1118, #65535
static TABELAdy + #1119, #65535
; A = 70 (diagonal inferior direita)
static TABELAdy + #1120, #65535
static TABELAdy + #1121, #65535
static TABELAdy + #1122, #65535
static TABELAdy + #1123, #65535
static TABELAdy + #1124, #65535
static TABELAdy + #1125, #65535
static TABELAdy + #1126, #65535
static TABELAdy + #1127, #65535
static TABELAdy + #1128, #65535
static TABELAdy + #1129, #65535
static TABELAdy + #1130, #65535
static TABELAdy + #1131, #65535
static TABELAdy + #1132, #65535
static TABELAdy + #1133, #65535
static TABELAdy + #1134, #65535
static TABELAdy + #1135, #65535
; A = 71
static TABELAdy + #1136, #65535
static TABELAdy + #1137, #65535
static TABELAdy + #1138, #0
static TABELAdy + #1139, #65535
static TABELAdy + #1140, #65535
static TABELAdy + #1141, #65535
static TABELAdy + #1142, #65535
static TABELAdy + #1143, #65535
static TABELAdy + #1144, #65535
static TABELAdy + #1145, #0
static TABELAdy + #1146, #65535
static TABELAdy + #1147, #65535
static TABELAdy + #1148, #65535
static TABELAdy + #1149, #65535
static TABELAdy + #1150, #65535
static TABELAdy + #1151, #65535
; A = 72
static TABELAdy + #1152, #65535
static TABELAdy + #1153, #0
static TABELAdy + #1154, #65535
static TABELAdy + #1155, #65535
static TABELAdy + #1156, #65535
static TABELAdy + #1157, #0
static TABELAdy + #1158, #65535
static TABELAdy + #1159, #65535
static TABELAdy + #1160, #65535
static TABELAdy + #1161, #0
static TABELAdy + #1162, #65535
static TABELAdy + #1163, #65535
static TABELAdy + #1164, #65535
static TABELAdy + #1165, #0
static TABELAdy + #1166, #65535
static TABELAdy + #1167, #65535
; A = 73
static TABELAdy + #1168, #0
static TABELAdy + #1169, #65535
static TABELAdy + #1170, #0
static TABELAdy + #1171, #65535
static TABELAdy + #1172, #65535
static TABELAdy + #1173, #0
static TABELAdy + #1174, #65535
static TABELAdy + #1175, #0
static TABELAdy + #1176, #65535
static TABELAdy + #1177, #65535
static TABELAdy + #1178, #0
static TABELAdy + #1179, #65535
static TABELAdy + #1180, #0
static TABELAdy + #1181, #65535
static TABELAdy + #1182, #65535
static TABELAdy + #1183, #0
; A = 74
static TABELAdy + #1184, #0
static TABELAdy + #1185, #65535
static TABELAdy + #1186, #0
static TABELAdy + #1187, #65535
static TABELAdy + #1188, #0
static TABELAdy + #1189, #65535
static TABELAdy + #1190, #0
static TABELAdy + #1191, #65535
static TABELAdy + #1192, #0
static TABELAdy + #1193, #65535
static TABELAdy + #1194, #0
static TABELAdy + #1195, #65535
static TABELAdy + #1196, #0
static TABELAdy + #1197, #65535
static TABELAdy + #1198, #0
static TABELAdy + #1199, #65535
; A = 75
static TABELAdy + #1200, #0
static TABELAdy + #1201, #65535
static TABELAdy + #1202, #0
static TABELAdy + #1203, #0
static TABELAdy + #1204, #65535
static TABELAdy + #1205, #0
static TABELAdy + #1206, #65535
static TABELAdy + #1207, #0
static TABELAdy + #1208, #0
static TABELAdy + #1209, #65535
static TABELAdy + #1210, #0
static TABELAdy + #1211, #65535
static TABELAdy + #1212, #0
static TABELAdy + #1213, #0
static TABELAdy + #1214, #65535
static TABELAdy + #1215, #0
; A = 76
static TABELAdy + #1216, #0
static TABELAdy + #1217, #0
static TABELAdy + #1218, #65535
static TABELAdy + #1219, #0
static TABELAdy + #1220, #0
static TABELAdy + #1221, #65535
static TABELAdy + #1222, #0
static TABELAdy + #1223, #0
static TABELAdy + #1224, #65535
static TABELAdy + #1225, #0
static TABELAdy + #1226, #0
static TABELAdy + #1227, #65535
static TABELAdy + #1228, #0
static TABELAdy + #1229, #0
static TABELAdy + #1230, #65535
static TABELAdy + #1231, #0
; A = 77
static TABELAdy + #1232, #0
static TABELAdy + #1233, #0
static TABELAdy + #1234, #0
static TABELAdy + #1235, #65535
static TABELAdy + #1236, #0
static TABELAdy + #1237, #0
static TABELAdy + #1238, #0
static TABELAdy + #1239, #65535
static TABELAdy + #1240, #0
static TABELAdy + #1241, #0
static TABELAdy + #1242, #0
static TABELAdy + #1243, #65535
static TABELAdy + #1244, #0
static TABELAdy + #1245, #0
static TABELAdy + #1246, #0
static TABELAdy + #1247, #65535
; A = 78
static TABELAdy + #1248, #0
static TABELAdy + #1249, #0
static TABELAdy + #1250, #0
static TABELAdy + #1251, #0
static TABELAdy + #1252, #65535
static TABELAdy + #1253, #0
static TABELAdy + #1254, #0
static TABELAdy + #1255, #0
static TABELAdy + #1256, #0
static TABELAdy + #1257, #65535
static TABELAdy + #1258, #0
static TABELAdy + #1259, #0
static TABELAdy + #1260, #0
static TABELAdy + #1261, #0
static TABELAdy + #1262, #65535
static TABELAdy + #1263, #0
; A = 79
static TABELAdy + #1264, #0
static TABELAdy + #1265, #0
static TABELAdy + #1266, #0
static TABELAdy + #1267, #0
static TABELAdy + #1268, #0
static TABELAdy + #1269, #0
static TABELAdy + #1270, #0
static TABELAdy + #1271, #65535
static TABELAdy + #1272, #0
static TABELAdy + #1273, #0
static TABELAdy + #1274, #0
static TABELAdy + #1275, #0
static TABELAdy + #1276, #0
static TABELAdy + #1277, #0
static TABELAdy + #1278, #0
static TABELAdy + #1279, #65535

TABELAtmax: var #80
; A = 0
static TABELAtmax + #0, #16
; A = 1-9
static TABELAtmax + #1, #16
static TABELAtmax + #2, #15
static TABELAtmax + #3, #16
static TABELAtmax + #4, #15
static TABELAtmax + #5, #15
static TABELAtmax + #6, #16
static TABELAtmax + #7, #15
static TABELAtmax + #8, #15
static TABELAtmax + #9, #14
; A = 10 
static TABELAtmax + #10, #16	
; A = 11 - 19
static TABELAtmax + #11, #14
static TABELAtmax + #12, #15
static TABELAtmax + #13, #15
static TABELAtmax + #14, #16
static TABELAtmax + #15, #15
static TABELAtmax + #16, #15
static TABELAtmax + #17, #16
static TABELAtmax + #18, #15
static TABELAtmax + #19, #16
; A = 20
static TABELAtmax + #20, #16
; A = 21 - 29
static TABELAtmax + #21, #16
static TABELAtmax + #22, #15
static TABELAtmax + #23, #16
static TABELAtmax + #24, #15
static TABELAtmax + #25, #15
static TABELAtmax + #26, #16
static TABELAtmax + #27, #15
static TABELAtmax + #28, #15
static TABELAtmax + #29, #14
; A = 30
static TABELAtmax + #30, #16
; A = 31 - 39
static TABELAtmax + #31, #14
static TABELAtmax + #32, #15
static TABELAtmax + #33, #15
static TABELAtmax + #34, #16
static TABELAtmax + #35, #15
static TABELAtmax + #36, #15
static TABELAtmax + #37, #16
static TABELAtmax + #38, #15
static TABELAtmax + #39, #16
; A = 40
static TABELAtmax + #40, #16
; A = 41 - 49
static TABELAtmax + #41, #16
static TABELAtmax + #42, #15
static TABELAtmax + #43, #16
static TABELAtmax + #44, #15
static TABELAtmax + #45, #15
static TABELAtmax + #46, #16
static TABELAtmax + #47, #15
static TABELAtmax + #48, #15
static TABELAtmax + #49, #14
; A = 50
static TABELAtmax + #50, #16
; A = 51 - 59
static TABELAtmax + #51, #14
static TABELAtmax + #52, #15
static TABELAtmax + #53, #15
static TABELAtmax + #54, #16
static TABELAtmax + #55, #15
static TABELAtmax + #56, #15
static TABELAtmax + #57, #16
static TABELAtmax + #58, #15
static TABELAtmax + #59, #16
; A = 60
static TABELAtmax + #60, #16
; A = 61 - 69
static TABELAtmax + #61, #16
static TABELAtmax + #62, #15
static TABELAtmax + #63, #16
static TABELAtmax + #64, #15
static TABELAtmax + #65, #15
static TABELAtmax + #66, #16
static TABELAtmax + #67, #15
static TABELAtmax + #68, #15
static TABELAtmax + #69, #14
; A = 70
static TABELAtmax + #70, #16
; A = 71 - 79
static TABELAtmax + #71, #14
static TABELAtmax + #72, #15
static TABELAtmax + #73, #15
static TABELAtmax + #74, #16
static TABELAtmax + #75, #15
static TABELAtmax + #76, #15
static TABELAtmax + #77, #16
static TABELAtmax + #78, #15
static TABELAtmax + #79, #16