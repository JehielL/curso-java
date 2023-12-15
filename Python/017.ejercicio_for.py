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

num_aprobados = 0 
num_suspensos = 0

for calificacion in calificaciones:
    
    nota = int(calificacion.split()[1])
    
    if nota >= 5:
        num_aprobados += 1
    else: 
        num_suspensos += 1
        
num_total = len(calificaciones)

porcentaje_aprobados = round((num_aprobados / num_total)* 100 ,2)
print(f"Numero aprobados : {num_aprobados}")
print(f"Numero de suspendidos: {num_suspensos}")
print(f"% de Aprobados {porcentaje_aprobados}")