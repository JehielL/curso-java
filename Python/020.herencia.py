class Vehiculo: 
    
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
    
class Coche(Vehiculo):
    def __init__(self, num_puertas, fabricante, modelo, color, cc):
        super().__init__(fabricante, modelo, color,cc)
        self.num_puertas = num_puertas
       
class Moto(Vehiculo):
    def __init__(self ,baul ,copiloto, fabricante, modelo, color, cc):
        super().__init__(fabricante, modelo, color, cc)
        self.baul = baul
        self.copiloto = copiloto
          
