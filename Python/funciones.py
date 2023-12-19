def filtrar_precios(precios, precio_min, precio_max):
    resultados = []
    for precio in precios:
        if precio_min <= precio <= precio_max:
            resultados.append(precio)
    return resultados

