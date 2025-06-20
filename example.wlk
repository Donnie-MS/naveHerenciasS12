
class NaveEspacial {
  var property direccionRespectoAlSol
  var velocidad

  var combustible 
  method combustible() = combustible
  method cargarCombustible(cantidad) {combustible += cantidad}
  method descargarCombustible(cantidad) {combustible -= cantidad}

  method escapar()
  method avisar()
  method recibirAmenaza() {
    self.escapar()
    self.avisar()
  }

  method acelerar(cuanto) {velocidad += cuanto}
  method desacelerar(cuanto) {velocidad -= cuanto}
  method irHaciaElSol() {direccionRespectoAlSol = 10}
  method escaparDelSol() {direccionRespectoAlSol = -10}
  method PonerseParaleloAlSol() {direccionRespectoAlSol = 0}
  method acercarseUnPocoAlSol() {
    direccionRespectoAlSol = 10.min(direccionRespectoAlSol + 1)
  }
  method alejarseUnPocoDelSol() {
    direccionRespectoAlSol = -10.max(direccionRespectoAlSol - 1)
  }
  method prepararViaje() {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }
  method estaTranquila() = combustible >= 4000 and velocidad <= 12000
}
class NaveBaliza inherits NaveEspacial {
  var colorBaliza
  const coloresValidos = #{"verde", "rojo", "azul"}
  method cambiarColorDeBaliza(colorNuevo) {
    if(!coloresValidos.contains(colorNuevo)) {
      self.error("el color nuevo no es válido")
    }
    colorBaliza = colorNuevo
  }
  override method prepararViaje() {
    super()
    self.cambiarColorDeBaliza("verde")
    self.PonerseParaleloAlSol()
  }
  override method estaTranquila() = super() and coloresValidos != "rojo"
  override method escapar() {
    self.irHaciaElSol()
  }
  override method avisar() {
    self.cambiarColorDeBaliza("rojo")
  }
}
class NavePasajeros inherits NaveEspacial {
  var property cantPasajeros 
  var cantDeComida
  var cantDeBebida
  method cargarComida(cantidad) {
    cantDeComida += cantidad
  }
  method cargarBebida(cantidad) {
    cantDeBebida += cantidad
  }
  method darRacionesYDosBebidas() {
    cantDeComida =- cantPasajeros
    cantDeBebida =- cantPasajeros*2
  }
  override method prepararViaje() {
    super()
    self.cargarComida(4 * cantPasajeros)
    self.cargarBebida(6 * cantPasajeros)
  }
  override method escapar() {
    self.acelerar(velocidad)
  }
  override method avisar() {
    self.darRacionesYDosBebidas()
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
    super()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }
  override method estaTranquila() = super() and !self.misilesDesplegados()
  override method escapar() {
    self.acercarseUnPocoAlSol()
    self.acercarseUnPocoAlSol()
  }
  override method avisar() {
    self.emitioMensaje("Amenaza recibida")
  }
}
class NaveHospital inherits NavePasajeros{
  var property tienePreparadoQuirofanos = false
  method prepararQuirofanos() {tienePreparadoQuirofanos = true}
  method usarQuirofano() {tienePreparadoQuirofanos = false}
  override method estaTranquila() = super() and self.tienePreparadoQuirofanos()
}
class NaveSigilosa inherits NaveDeCombate{
  override method estaTranquila() = super() and !self.estaInvisible() 
}
