## DIVISION

print(50 / 30)
print(round(50 / 30, 2))

##division entera (//)

regalos = 123
alumnos = 25

regalos_por_persona = regalos // alumnos

print(f" Regalos por persona {regalos_por_persona}")

## Exponente (**)

print(2**3)
print(3**3)


## Todos estos siguientes operadores devuelven boolean.
## Igual ==

password = input("Introduce tu contraseña:")
password_correct = "admin"
print(password == password_correct)

email = input("Introduce tu email").lower()
email_correct = "jehiel@gmail.com"
print(email == email_correct)

password = input("Introduce tu contraseña:")
password_correct = "admin"
print(password == password_correct)
if password != password_correct:
    print("Credenciales Incorrectas")

respueta_correcta = "madrid"
capital = input("Introduce capital de España: ").lower().replace(" ", "")

if capital != respueta_correcta:
    print("Respuesta correcta")
else:
    print("Has acertado, toma un pin")


# > Mayor que (Greater than, GT)
# >= Mayor o igual que (Greater than or equals, GTE)

print(50 > 20)
print(50 > 50)
print(50 >= 50)
print(50 > 50)
print(50 > 100)

# < menor que (less than,  lt)
# <= menor o igual que (less than,  LTE)
print(50 < 20)
print(50 < 50)
print(50 <= 50)
print(50 < 50)
print(50 < 100)

