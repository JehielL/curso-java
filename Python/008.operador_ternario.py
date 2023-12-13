#if else normal

numero = -10
numero_absoluto = None 

if numero <=0:
    numero_absoluto = -numero
else:
    numero_absoluto = numero

print(numero_absoluto)

numero_absoluto = -numero if numero <=0 else numero