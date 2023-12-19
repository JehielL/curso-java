
def contar_vocales(string):
    cantidad_vocales = 0 
    
    for vocal in string:
        if vocal in "aeiouAEIOUáéíóúÁÉÍÓÚ":
            cantidad_vocales +=1
    return cantidad_vocales
            
resultado1 = contar_vocales("El rincon de la casa redonda")
print(resultado1)