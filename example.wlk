class NaveEspacial {
  var property direccionRespectoAlSol
  method velocidad()//kms/seg
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
}

/*
Naves de combate
Entienden estos mensajes:
ponerseVisible(), ponerseInvisible(), estaInvisible(): puede estar visiblo o invisible.
desplegarMisiles(), replegarMisiles(), misilesDesplegados(): los misiles pueden, o no, estar desplegados.
emitirMensaje(mensaje), mensajesEmitidos(), primerMensajeEmitido(), ultimoMensajeEmitido(),
 esEscueta(), emitioMensaje(mensaje).


Las naves de combate tienen la capacidad de emitir mensajes,
 cada mensaje se representa como un String, p.ej. "Llegando a Saturno". 
 Una nave de combate es escueta si no emitió ningún mensaje de más de 30 caracteres.
Todas las naves tienen que ser capaces de entender el mensaje prepararViaje().
 Lo que hace cada nave cuando le indican que debe preparar un viaje depende de qué tipo de nave sea:

las naves-baliza cambian el color de la baliza a verde, y se ponen paralelas al Sol.
las naves de pasajeros cargan 4 raciones de comida, 
y 6 de bebida, para cada pasajero que llevan. Además, 
se acercan un poco al Sol.
las naves de combate se ponen visibles, repliegan sus misiles,
 aceleran 15000 kms/seg, y emiten el mensaje "Saliendo en misión".
*/