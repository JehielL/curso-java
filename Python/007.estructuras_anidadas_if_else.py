nivel = 2
puntos = 35

if nivel ==1:
    
    if puntos <20: 
        print('Mal comienzo')
    else:
        print('Buen Comienzo')

elif nivel == 2:
    if puntos < 30:
        print('Podria hacerse mejor para el nivel 2')
    else:
        print('Gran avance de nivel')
elif nivel == 3:
    if puntos < 40:
        print('Mejorable')
    else:
        print('Gran avance de nivel')