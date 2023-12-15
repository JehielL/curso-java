vehiculos = ["Lamborghini", "Ferrari", "Masseratti", "Volkswagen", "Citroen", "Ford"]

while True:
    try:
        indice = int(input(f"Introduce el vehículo que deseas usar hoy (0 a {len(vehiculos)-1}): "))
        vehiculo = vehiculos[indice]
        print(f"Excelente decisión, has elegido el vehículo {indice}: {vehiculo}")
        break

    except (ValueError, TypeError):
        print('Introduce un valor correcto')
        
# Errores separados.

vehiculos = ["Lamborghini", "Ferrari", "Masseratti", "Volkswagen", "Citroen", "Ford"]

while True:
    try:
        indice = int(input(f"Introduce el vehículo que deseas usar hoy (0 a {len(vehiculos)-1}): "))
        vehiculo = vehiculos[indice]
        print(f"Excelente decisión, has elegido el vehículo {indice}: {vehiculo}")
        break

    except ValueError as e:
        print(f'se ha producido un error de formato de dato, es el siguiente: {e}')
    except IndexError as e:
        print(f'Numero invalido, indice incorrecto. Error : {e}')


#Manejo de cualquier error 

vehiculos = ["Lamborghini", "Ferrari", "Masseratti", "Volkswagen", "Citroen", "Ford"]

while True:
    try:
        indice = int(input(f"Introduce el vehículo que deseas usar hoy (0 a {len(vehiculos)-1}): "))
        vehiculo = vehiculos[indice]
        print(f"Excelente decisión, has elegido el vehículo {indice}: {vehiculo}")
        break

    except Exception as e:
        print(f'se ha producido un error de formato de dato, es el siguiente: {e}')
   


