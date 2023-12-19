def filtrar_precios(precios, precio_min, precio_max):
    resultados = []
    for precio in precios:
        if precio_min <= precio <= precio_max:
            resultados.append(precio)
    return resultados



precios = [20.33, 30.88, 33.88, 60.55, 20.99]

precios_corregidos = filtrar_precios(precios , 20, 50)
print(precios_corregidos)