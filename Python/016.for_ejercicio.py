calificaciones = [
    'Jehiel 10', 
    'Carlos 2', 
    'Alan 6', 
    'Pedro 9', 
    'Martin 4', 
    'Elene 1', 
    'Paul 2', 
    'Courtois 9', 
    'Petra 10',
    'Carmina 7'
]

alumnos_aprobados = [] 

for calificacion in calificaciones:
    nombre, nota = calificacion.split()
    nota = int(nota)
    
    if nota > 5:
        alumnos_aprobados.append((nombre, nota))  
        print(f'Los alumnos aprobados son {nombre} con una nota de {nota}')
    else:
        print(f"Los alumnos reprobados son: {nombre} con una nota de {nota}")

porcentaje_aprobados = (len(alumnos_aprobados) / len(calificaciones)) * 100

print(f"Este es el porcentaje que han pasado, hasta luego maricarmen {porcentaje_aprobados}")

