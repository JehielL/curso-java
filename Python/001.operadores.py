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
    
##NOT invierte una condición existente.


edad = int(input('Introduce tu edad : '))
if not edad >= 18:
    print('No tiene Acceso.')
    
##operadores de identidad 

email = None

email_user = input('Introduce tu email: ')

if email_user.endswith('gmail.com'):
    email = email_user
    
if email is None:
    print('No se ha podido completar el registro')


#is not

if email is not None:
    print('El email es correcto , registro completado')
    
#if else

if email is None:
    print('No se ha podido completar el registro')
else:
    print('El email es correcto, registro completado')
    
# operadores de membresia

#in con textos 

print('java' in 'curso avanzado de java con spring')

#in en listas

students = ['jehiel', 'noemi', 'judith', 'carlos',' ronald']
name = input("introduce tu nombre: ")

if name in students :
    print('Tienes acceso al curso')
else:
    print('No tienes acceso')




# not in

if name not in students:
    print('No puedes entrar')
else:
    print('Puedes entrar al curso de Java')
    
