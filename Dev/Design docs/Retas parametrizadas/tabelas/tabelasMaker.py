with open("dxValores.txt", "r") as f:
	linhas_dx = f.readlines()

with open("dyValores.txt", "r") as f:
	linhas_dy = f.readlines()

with open("tmaxValores.txt", "r") as f:
	linhas_teto = f.readlines()

indice = 0

for i in range(len(linhas_dx)):
	if i == 0:
		continue
	if(linhas_dx[i].strip()[0] == ";"):
		continue

	modificado = f"static CINEMATICA_LINEAR_DX + #{indice}, #{linhas_dx[i]}"
	linhas_dx[i] = modificado

	indice += 1

indice = 0

for i in range(len(linhas_dy)):
	if i == 0:
		continue
	if(linhas_dy[i].strip()[0] == ";"):
		continue

	modificado = f"static CINEMATICA_LINEAR_DY + #{indice}, #{linhas_dy[i]}"
	linhas_dy[i] = modificado

	indice += 1

indice = 0

for i in range(len(linhas_teto)):	
	if i == 0:
		continue
	if(linhas_teto[i].strip()[0] == ";"):
		continue

	modificado = f"static CINEMATICA_LINEAR_TETO + #{indice}, #{linhas_teto[i]}"
	linhas_teto[i] = modificado

	indice += 1

with open("CINEMATICA_LINEAR_DX", "w") as f:
	f.writelines(linhas_dx)

with open("CINEMATICA_LINEAR_DY", "w") as f:
	f.writelines(linhas_dy)

with open("CINEMATICA_LINEAR_TETO", "w") as f:
	f.writelines(linhas_teto)
