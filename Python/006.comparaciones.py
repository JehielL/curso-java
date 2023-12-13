

precioTotal = float(input('Introduce el precio de tu compra: '))

if precioTotal >= 100:
    print(f'Precio Elevado, tu precio total es : {precioTotal}')

elif precioTotal >= 50:
    print(f"precio Economico, es: {precioTotal}")
    
else:
    print(f"es Super Barato, es: {precioTotal}")

hora = float(input('Introduce la hora (formato de 24 horas): '))

if 0 <= hora < 8:
    print("Jehiel esta durmiendo.")
elif 8 <= hora < 15:
    print("En clases con Alan.")
elif 15 <= hora < 16:
    print("Estoy comiendo.")
elif 16 <= hora < 21:
    print("Clases de java con adecco")
elif 21 <= hora < 24:
    print("Durmiendo")
else:
    print(" Introduce  una hora correcta")
