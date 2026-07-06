import re # regular expression

def pre_processar(arqIn, arqOut):

    REGISTRADORES = ["r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "sp", "fr", "pc", "ir"]

    MACROS = { # cada macro é uma keyword

        # sintaxe: @GET rd, rs, Entity.Prop
        # rd = campo extraído
        # rs = word completa (inalterada após o fim da pseudoinstrução)
        "@GET": [
            "mov {rd}, {rs}",
            "shiftl0 {rd}, {left}",
            "shiftr0 {rd}, {right}"
        ],
        
        # sintaxe: @SET rd, rs, Entity.Prop
        # rd = word completa
        # rs = novo valor (inalterado após o fim da pseudoinstrução)
        "@SET": [
            "rotl {rd}, {left}",
            "shiftl0 {rd}, {size}",
            "or {rd}, {rd}, {rs}",
            "rotl {rd}, {right}"
        ]
    }

    WORDS = { # 
        "Objeto": {
            "tipo": {"left": 14, "right": 0, "size": 2},
        },
        "EB0": {
            "funcaoMov": {"left": 12, "right": 2, "size": 2},
            "funcaoTV": {"left": 8, "right": 4, "size": 4},
            "cor": {"left": 0, "right": 8, "size": 8}
        },
        "EB1": {
            "funcaoAtu": {"left": 12, "right": 0, "size": 4},
            "x": {"left": 6, "right": 4, "size": 6},
            "y": {"left": 0, "right": 10, "size": 6}
        },
        "EB2RP": {
            "t": {"left": 12, "right": 0, "size": 4},
            "A": {"left": 5, "right": 4, "size": 7}
        },
        "EB3L": {
            "dA": {"left": 12, "right": 0, "size": 4},
            "df": {"left": 5, "right": 4, "size": 7}
        },
    }

    with open(arqIn, "r") as f: # abre o arquivo na filestream f
        lines = f.readlines() # lines é uma lista de strings

    contador_linha = 0
    erro = False
    final_code = []

    def error(msg):
        nonlocal contador_linha
        nonlocal erro 
        print(f"ERRO NA LINHA {contador_linha}: {msg}")
        erro = True

    for line in lines:
        contador_linha += 1

        stripped = line.strip()
        if not stripped:
            final_code.append(line)
            continue
        primeiro_char_index = line.find(stripped[0])
        indentacao = line[:primeiro_char_index]
        if ";" in stripped:
            codigo, comentario = stripped.split(";", 1)
            codigo = codigo.strip()
            comentario = ";" + comentario
        else:
            codigo = stripped
            comentario = ""

        if not codigo:
            final_code.append(line)
            continue

        parts = re.split(r"[,\s]+", codigo)
        instruction = parts[0]
        arguments = parts[1:]
        for arg in arguments:
            if arg.isnumeric():
                print(f"FALTA # NA LINHA {contador_linha}")
            if arg.endswith(":"):
                error("LABEL NÃO PODE SER ARGUMENTO")



        if instruction == "@GET":
            if (len(arguments) != 4):
                error("QUANTIDADE DE ARGUMENTOS INVÁLIDA")

            rd = arguments[0]
            rs = arguments[1]
            ri = arguments[2]
            for reg in [rd, rs, ri]:
                if reg not in REGISTRADORES:
                    error(f"{reg} NÃO É UM REGISTRADOR VÁLIDO")

            entity_prop = arguments[3].split(".")
            if (len(entity_prop) != 2):
                error("ENTIDADE E PROPRIEDADE NÃO BEM DEFINIDAS")
            entity, prop = entity_prop

            if entity not in WORDS:
                error(f"ENTIDADE \"{entity}\" NÃO EXISTE")
            elif prop not in WORDS[entity]:
                error(f"PROPRIEDADE \"{prop}\" DE ENTIDADE \"{entity}\" NÃO EXISTE")
            else:
                metadata = WORDS[entity][prop]
                final_code.append(indentacao + f";--- EXPANSÃO DE {stripped} ---\n")

                for expansion in MACROS[instruction]: # expansion é uma instrução low-level
                    new_line = expansion.format( # o método .format da string vai pegar cada {x} e substituir por um valor
                        rd=rd, # {rd} é substituído pelo rd que pegamos da instrução alto nível
                        rs=rs, # {rs} é substituído pelo rs que pegamos da instrução alto nível
                        ri=ri,
                        mask=metadata["mask"],
                        shift=metadata["shift"]
                    )

                    final_code.append(indentacao + new_line + "\n")

                final_code.append(indentacao + f";--- FIM DA EXPANSÃO ---\n")



        elif instruction == "@SET":
            if(len(arguments) != 4):
                error("QUANTIDADE DE ARGUMENTOS INVÁLIDA")

            rd = arguments[0]
            rs = arguments[1]
            ri = arguments[2]
            for reg in [rd, rs, ri]:
                if reg not in REGISTRADORES:
                    error(f"{reg} NÃO É UM REGISTRADOR VÁLIDO")

            entity_prop = arguments[3].split(".")
            if (len(entity_prop) != 2):
                error("ENTIDADE E PROPRIEDADE NÃO BEM DEFINIDAS")
            entity, prop = entity_prop

            if entity not in WORDS:
                error(f"ENTIDADE \"{entity}\" NÃO EXISTE") # talvez passar fstring como parametro não funcione
            elif prop not in WORDS[entity]:
                error(f"PROPRIEDADE \"{prop}\" DE ENTIDADE \"{entity}\" NÃO EXISTE")
            else:
                metadata = WORDS[entity][prop]
                final_code.append(indentacao + f";-- EXPANSÃO DE {stripped} --\n" + comentario)

                for expansion in MACROS[instruction]:  # expansion é uma instrução low-level
                    new_line = expansion.format(  # o método .format da string vai pegar cada {x} e substituir por um valor
                        rd=rd,  # {rd} é substituído pelo rd que pegamos da instrução alto nível
                        rs=rs,  # {rs} é substituído pelo rs que pegamos da instrução alto nível
                        ri=ri,
                        inv_mask=0xFFFF ^ metadata["mask"],
                        shift=metadata["shift"]
                    )

                    final_code.append(indentacao + new_line + "\n")

                final_code.append(indentacao + f";--- FIM DA EXPANSÃO ---\n")

        else:
            final_code.append(line)

    if not erro:
        with open(arqOut, "w") as f:
            f.writelines(final_code)
