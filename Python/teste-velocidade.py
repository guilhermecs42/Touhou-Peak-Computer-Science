import pygame as pg
from sys import exit

WIDTH = 1920
HEIGHT = 1080
PADDING_X = 100
PADDING_Y = 50
pg.init()

class ObjetoContinuo:

	def __init__(self, x, y, v):
		self.x = x
		self.y = y
		self.v = v

	def update(self, TELA):
		raio = PADDING_X/f
		pg.draw.circle(TELA, "Black", (self.x, self.y), raio)
		self.x += self.v
		pg.draw.circle(TELA, "White", (self.x, self.y), raio)
		if(self.x > WIDTH+raio):
			self.x = -raio

		


TELA = pg.display.set_mode((WIDTH, HEIGHT)) # resolução da tela
clock = pg.time.Clock() # criando o clock

f = 16
x = PADDING_X
y = PADDING_Y
Objetos = []
for i in range(1, f+1):
	Objetos.append(ObjetoContinuo(x, y, 10/i))
	y += (HEIGHT-PADDING_Y)/f

RODANDO = True
while RODANDO:
	for event in pg.event.get():
		if event.type == pg.QUIT:
			RODANDO = False # para de rodar se o usuário apertar o X da tela

	for Obj in Objetos:
		Obj.update(TELA) # atualiza

	pg.display.update() # atualiza a tela
	clock.tick(100) # limita o framerate em 100FPS, mas não garante esse framerate

pg.quit() # desliga o pygame
exit() # termina o programa 