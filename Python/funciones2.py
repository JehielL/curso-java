import funciones as fu

precios = [2.50, 3.33, 9.50, 4.40, 6.50, 33.66, 77.56, 49.97, 1.23, 5.54, 43.42]

def ver_precios(precios):
    print('Ha elegido Ver los precios')
    print(precios)

def consultar_precio(precios):
    posicion_precio = fu.read_int('Introduce la posición del precio que deseas consultar: ')
    if 0 <= posicion_precio <= len(precios):
        print(precios[posicion_precio - 1])
    else: 
        print('Introduce una Posición correcta.')

def crear_precio(precios):
    print('Has introducido la opción de Crear un nuevo precio.')
    nuevo_precio = fu.read_float('Introduce nuevo precio: ')
    precios.append(nuevo_precio)
    print(f"Precio nuevo Agregado: {nuevo_precio}")

def actualizar_precio(precios):
    print('Haz introducido Actualizar un Precio')
    posicion_por_actualizar = fu.read_int('Introduce la posicion del precio por actualizar: ')
    if 0 <= posicion_por_actualizar <= len(precios):
        new_precio = fu.read_float('Introduce un nuevo precio: ')
        precios[posicion_por_actualizar - 1] = new_precio
        print(f"Haz actualizado el precio correctamente, nuevo precio es: {new_precio}")
    else:
        print('Introduce una Posición correcta.')

def eliminar_precio(precios):
    print('Haz introducido eliminar un Precio')
    posicion_por_eliminar = fu.read_int('Introduce la posicion del precio a eliminar: ')
    if 1 <= posicion_por_eliminar < len(precios):
        del_precio = precios.pop(posicion_por_eliminar - 1)
            
        print(f"Haz eliminado el precio {del_precio} correctamente")
    else:
        print('Introduce una Posición correcta.')

def vaciar_precios():
    print('Haz decidido Eliminar todos los precios')
    confirmacion = fu.read_bool('¿Estas seguro de eliminar los precios (si/no): ')
    if confirmacion:
            #precios.clear
        precios = []
        print(f'Lista de precios vaciadas {precios}' )
    else:
        print('No se eliminaran los Precios')
    return precios

def precio_max(precios):
    print('Has escogido la opcion de eliminar precios superiores al numero por introducir: ')
    precio_maximo = fu.read_float('Introduce el precio mayor a establecer: ')
        
    precios = [precio for precio in precios if precio <= precio_maximo]

while True:
    print('''Elige una opcion:
          1- Ver todos los precios.  
          2- Ver un precio por posición.
          3- Crear un nuevo precio.
          4- Actualizar un precio existente. 
          5- Borrar un precio existente. 
          6- Vaciar todos los precios.
          7- Eliminar los precios superiores a un numero introducido por el usuario 
          8- Salir.''')
    i = fu.read_int('Introduce un numero del 1 al 7: ')
    if i == 1:
        ver_precios(precios)
    elif i == 2:
        consultar_precio(precios)
    elif i == 3:
        crear_precio(precios)
    elif i == 4:
        actualizar_precio(precios)
    elif i == 5:
        eliminar_precio(precios)
    elif i == 6:
        precios = vaciar_precios()
    elif i == 7:
        precio_max(precios)
   
    elif i == 8:
        print('Haz escogido Salir del sistema')   
        break     
            
    else:
        print('Opcion Incorrecta, introduce un valor entre 1-8')