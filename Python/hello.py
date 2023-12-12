print('Hello')

aprobado = True
activo = False



#format con dos juecos 

mensaje = "hola curso{} la nota minima es de {} "
print(mensaje.format("java",5))

plantilla = '{} {} {}'

texto_capitalized = plantilla.format(
    
    palabras[0].capitalize(),
    palabras[1].capitalize(),
    palabras[2].capitalize()
)

print(texto_capitalized)