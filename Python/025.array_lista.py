import random

def generar_listas_aleatorias(nombres):
    random.shuffle(nombres)
    
    listas_aleatorias = [nombres[i:i+3] for i in range(0, len(nombres), 3)]
    
    return listas_aleatorias

nombres = input("Introduce los nombres separados por comas: ").split(',')

nombres = [nombre.strip() for nombre in nombres]

listas_aleatorias = generar_listas_aleatorias(nombres)

# Imprime las listas aleatorias
print("Listas aleatorias de 3 personas:")
for i, lista in enumerate(listas_aleatorias, start=1):
    print(f"Grupo {i}: {', '.join(lista)}")
