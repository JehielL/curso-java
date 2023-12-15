#Bucle while 

indice = 0

while indice < 20:
    print(f"Indice Actual: {indice}")
    indice += 1
print("Haz Salido del indice")

precios = [2.52, 3.25, 4.95, 7.38, 12.50, 9.60]
descuento = 0.10
indice2 = 0

while indice2 < len(precios):
    precios[indice2] *= 0.80
    indice2 += 1
print(precios)


