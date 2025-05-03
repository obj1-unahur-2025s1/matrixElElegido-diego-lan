object neo {
  var energia = 100


  method esElElegido() = true
  method saltar() {energia = energia / 2}
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = true


  method esElElegido() = false
  method saltar() {
    estaDescansado = not estaDescansado
    vitalidad = (vitalidad-1).max(0)}

  method vitalidad() = vitalidad
}

object trinity {
  method esElElegido() = false
  method vitalidad() = 0
  method saltar() {}
}


object nave {
  const pasajeros = #{neo, morfeo, trinity}

  method cantidadDePasajeros() = pasajeros.size()


  
  method pasajeroConMayorVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()})

  method pasajeroConMenorVitalidad() = pasajeros.min({pasajero => pasajero.vitalidad()})

  method estaEquilibrada() {
    return self.pasajeroConMayorVitalidad().vitalidad() < (self.pasajeroConMenorVitalidad().vitalidad() * 2)
  }

  method elElegidoEstaEnLaNave() = pasajeros.any({pasajero => pasajero.esElElegido()})

  method chocar() {
    pasajeros.forEach({pasajero => pasajero.saltar()})
    pasajeros.clear()
  }

  method acelerar() {
    pasajeros.filter({pasajero => not pasajero.esElElegido()}).forEach({pasajero => pasajero.saltar()})
    pasajeros.filter({pasajero => pasajero.esElElegido()}).forEach({pasajero => pasajeros.remove(pasajero)})
  }

}