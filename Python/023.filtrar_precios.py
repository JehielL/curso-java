def filtrar_precios(precios_introducidos, precio_minimo, precio_maximo):
   
    precios_filtrados = [precios_fil for 
                         precios_fil in 
                         precios_introducidos
                         if precio_minimo <= precio_maximo]
   
    return precios_filtrados

precios = [20.99, 42.33, 55.50, 90.77, 36.77, 47.89]

precios_filtrados = filtrar_precios(precios, 30, 50)
print(precios_filtrados)

