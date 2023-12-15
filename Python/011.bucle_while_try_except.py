# Leer  edad hasta que el usuario escriba una edad correcta entre 18 a 100

while True:
    
    
    try: 
     edad_usuario = int(input('Introduce tu edad: '))
     
     if 18 <= edad_usuario <= 100:
         print('Edad Correcta')
         break
     
    except ValueError:
        print('Formato incorrecto, debe ser alfanumerico')
        