import sys
from pre_processador import pre_processar
from pathlib import Path

with open(sys.argv[1], "r") as f:
	lines = f.readlines()

dependencias = [sys.argv[1]]

for line in lines:
	stripped = line.strip()
	if not stripped:
		continue
	tokens = stripped.split(" ")
	if(len(tokens) < 2):
		error("ERRO: AS PRIMEIRAS LINHAS DA MAIN DEVEM SER import nomeArquivo.asm")
	if(tokens[0] != "import"):
		error("ERRO: AS PRIMEIRAS LINHAS DA MAIN DEVEM SER import nomeArquivo.asm")

	nomeArquivo = tokens[1]
	search_dir = Path("../")
	for file_path in search_dir.rglob(nomeArquivo):
		dependencias.append(str(file_path))

	print(lines[lines.index(line)])
	print(f";{line}")
	lines[lines.index(line)] = f";{line}"

with open(sys.argv[1], "w") as f:
    f.writelines(lines)

print(dependencias)

with open(sys.argv[2], "w") as f:
	for dep in dependencias:
		pre_processar(dep, ".temp")
		f.write("\n\n")
		f.write("; ----------\n")
		f.write(f"; ---------- arquivo: {dep} ----------\n")
		f.write("; ----------\n")
		f.write("\n")
		with open(".temp", "r") as g:
			lines = g.readlines()
		for line in lines:
			f.write(line)

os.remove(".temp")