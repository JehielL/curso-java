import random

def generar_listas_aleatorias(nombres):
    # Mezcla la lista de nombres de manera aleatoria
    random.shuffle(nombres)
    
    # Divide la lista en sublistas de 3 personas
    listas_aleatorias = [nombres[i:i+3] for i in range(0, len(nombres), 3)]
    
    return listas_aleatorias

# Ingresa la lista de nombres
nombres = input("Introduce los nombres separados por comas: ").split(',')

# Elimina espacios en blanco al principio y al final de cada nombre
nombres = [nombre.strip() for nombre in nombres]

# Genera las listas aleatorias
listas_aleatorias = generar_listas_aleatorias(nombres)

# Imprime las listas aleatorias
print("Listas aleatorias de 3 personas:")
for i, lista in enumerate(listas_aleatorias, start=1):
    print(f"Grupo {i}: {', '.join(lista)}")
