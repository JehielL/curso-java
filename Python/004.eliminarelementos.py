phones = ['643907051', '622139560','695139520', '677545090']

# Metodo remove , borra un elemento que pasemos por parametro

phones.remove('695139520')
print(phones)

# pop toma el ultimo elemento de la fila , lo muestra y elimina.
pendientes_calificacion = ['jehiel', 'noemi', 'judith', 'carlos',' ronald']

alumnos_a_calificar = pendientes_calificacion.pop()

print(alumnos_a_calificar)

fila_pescaderia = ['persona1', 'persona2', 'persona3', 'persona4']

persona_a_atender = fila_pescaderia.pop(0)
print(f"siguiente persona por atender {persona_a_atender}")

persona_a_atender = fila_pescaderia.pop(0)
print(f"siguiente persona por atender {persona_a_atender}")


# del permite borrar un elemento concreto sin devolverlo

precios = [5.99, 12.65, 4.99, 6.60, 7.20]

del precios[2]

print(precios)