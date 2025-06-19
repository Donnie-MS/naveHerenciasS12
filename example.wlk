class NaveEspacial {
  var property direccionRespectoAlSol
  var property velocidad
  method acelerar(cuanto)
  method desacelerar(cuanto)
  method irHaciaElSol() {direccionRespectoAlSol = 10}
  method escaparDelSol() {direccionRespectoAlSol = -10}
  method PonerseParaleloAlSol() {direccionRespectoAlSol = 0}
  method acercarseUnPocoAlSol() {
    direccionRespectoAlSol = 10.min(direccionRespectoAlSol + 1)
  }
  method alejarseUnPocoDelSol() {
    direccionRespectoAlSol = -10.max(direccionRespectoAlSol - 1)
  }
  method prepararViaje()
}
object verde{}
object rojo{}
object azul{}
class NaveBaliza inherits NaveEspacial {
  var colorBaliza
  const coloresValidos = #{verde, rojo, azul}
  method cambiarColorDeBaliza(colorNuevo) {
    if(!coloresValidos.contains(colorNuevo)) {
      self.error("el color nuevo no es válido")
    }
    colorBaliza = colorNuevo
  }
  override method prepararViaje() {
    self.cambiarColorDeBaliza(verde)
    self.PonerseParaleloAlSol()
  }
}
class NavesPasajeros inherits NaveEspacial {
  var property cantPasajeros 
  var cantDeComida
  var cantDeBebida
  method cargarComida(cantidad) {
    cantDeComida += cantidad
  }
  method cargarBebida(cantidad) {
    cantDeBebida += cantidad
  }
  override method prepararViaje() {
    self.cargarComida(4 * cantPasajeros)
    self.cargarBebida(6 * cantPasajeros)
  }
}
class NaveDeCombate inherits NaveEspacial {
  var property estaInvisible = false
  method ponerseVisible() {estaInvisible = false}
  method ponerseInvisible() {estaInvisible = true}

  var property misilesDesplegados = false
  method desplegarMisiles() {misilesDesplegados = true}
  method replegarMisiles() {misilesDesplegados = false}

  const mensajesEmitidos = []
  method emitirMensaje(mensaje) {mensajesEmitidos.add(mensaje)}
  method mensajesEmitidos() = mensajesEmitidos
  method primerMensajeEmitido() = mensajesEmitidos.first()
  method ultimoMensajeEmitido() = mensajesEmitidos.last()
  method esEscueta() = mensajesEmitidos.all({mensaje => mensaje.length() <= 30 })
  method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)

  override method prepararViaje() {
    self.ponerseVisible()
    self.replegarMisiles()
    self.velocidad(15000)
    self.emitirMensaje("Saliendo en misión")
  }
}
