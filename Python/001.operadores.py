email = input("Introduce tu email: ").lower()
password = input("Introduce tu contraseña: ")
password_correct = "admin"
email_correct = "admin@gmail.com"

if password == password_correct and email == email_correct:
    print("Eres hacker")
else:
    print("No eres Hacker")
while True:
    email = input("Introduce tu email: ").lower()
    password = input("Introduce tu contraseña: ")
    password_correct = "admin"
    email_correct = "admin@gmail.com"

    if password == password_correct and email == email_correct:
        print('¡Entraste!')
        break  
    else:
        print("¡No eres un hacker!")


es_estudiante = input('¿Eres estudiante? Si o No: ') == 'si'
precio = float(input('Introduce el precio de tu compra: '))

if es_estudiante or precio >= 100:
    print(f"Descuento del 20%, precio final: {precio * 0.80}")
else:
    print(f"Precio Final {precio}")