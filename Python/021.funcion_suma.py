def sumatorio(numeros):
    """funcion sumatorio, suma los elementos de la lista
    Args:
        numeros (_list_): lista de numeros enteros 

    Returns:
        devuelve suma total de los elementos de la lista
        
    """
    i = 0 
    for numero in numeros:
        i += numero
    return i

resultado1 = sumatorio([2, 5,10,50,33,90,33])
print(f"Resultado1: {resultado1}")

