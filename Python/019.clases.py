class Vehiculo: 
    num_ruedas = 4
    encendido = False
    velocidad = 0
    
    def __init__(self, fabricante, modelo, color, cc ):
        self.fabricante = fabricante
        self.modelo = modelo
        self.color = color
        self.cc = cc 
    def acelerar (self, cantidad):
        self.velocidad += cantidad
    
    def frenar (self, cantidad):
        self.velocidad -= cantidad
    
    def __str__(self):
        return "Vehiculo (fabricante: " + self.fabricante +  ", Modelo: " + self.modelo +  ", Color: " + self.color + ", velocidad: " + str(self.velocidad) + ")"
 
   
honda = Vehiculo("Honda", "Civic", "Rojo",  2.4)
alfa_romeo = Vehiculo("Alfa Romeo", "149", "negro", 1.9 )
honda.acelerar(100)
honda.frenar(20)

print(honda)
print(alfa_romeo)