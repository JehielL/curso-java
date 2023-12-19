def read_int(prompt):
    while True:
        try:
            return  int(input(prompt) )

        except Exception:
            print('No se ha podido leer el numero')
            
edad = read_int('Introduce tu edad')