# Pedir datos a un usuario con bucle while hasta que introduzca correctamente.

password = 'admin'

password_user = ''

while password_user != password:
    password_user = input('Introduce tu contraseña: ')
    
print('Accedo Concedido')


# Usuario puede introducir 3 contraseñas maximo.

password2 = 'admin'
password_user2 = ''
intento = 1 
max_intento = 3

while intento <= 3: 
    password_user = input('Introduce tu contraseña: ')  
    if password_user2 == password2:
        print('Contraseña correcta.')
        
        break
    intento += 1
if intento > max_intento:
    print(f'Haz alcanzado el numero de intentos. Numero de intentos permitidos {max_intento}.')