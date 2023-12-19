class Gato:
    def sonido(self):
        return "miau"

class Perro:
    def sonido(self):
        return "guau"

def hacer_sonido(animal):
    print(animal.sonido())

gato = Gato()
hacer_sonido(gato)

class Vehiculo():
    def __init__(self, velocidad_maxima):
        self.velocidad_maxima = velocidad_maxima

class Terrestre(Vehiculo):
    def __init__(self, ruedas, velocidad_maxima):
        super().__init__(velocidad_maxima)
        self.ruedas = ruedas

class Acuatico(Vehiculo):
    def __init__(self, flotadores, velocidad_maxima):
        super().__init__(velocidad_maxima)
        self.flotadores = flotadores

coche = Terrestre(4, 100)
barco = Acuatico(2, 50)
for vehiculo in [coche, barco]:
    print(vehiculo.velocidad_maxima)
    
mi_lista = [10, 3, 6, 5]
mi_lista.sort()
print(mi_lista)

import math
print(math.floor(math.pi))