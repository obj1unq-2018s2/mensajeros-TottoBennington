object mensajeria {
	var property empleados = []
	method contratar(alguien) {
 		empleados.add(alguien)
 	}
 	method despedir(alguien){
 		empleados.remove(alguien)
 	}
 	method despedirAtodos(){
// 		empleados.forEach({
// 			e=>empleados.remove(e)
// 		})
		empleados.clear()
 	}
 	method esGrandeLaMensajeria() = empleados.count()>=2
 	method puedeSerEnviadoPorPrimerEmp() = paquete.puedeSerEntregadoPor(empleados.first())
 	
 	method pesoDelUltimoEmp() = empleados.last().peso()
}
//--------------------------
object roberto{
	var property pesoPropio = 0
	var property vehiculo = camion
	var property peso = pesoPropio + camion.peso()
	const property puedeLlamar = false
}
// vehiculos de roberto
object bicicleta{
	method peso() = 8
}
object camion{
	var property cantAcoplados
	method peso() = 500 * cantAcoplados
}
//--------------------------
object chuckNorris{
	const property peso = 900
	const property puedeLlamar = true
}
object neo{
	const property peso = 0
	var property credito = false // asignarle credito antes de ver si puede llamar
	var property puedeLlamar = credito
}
object puenteDeBrooklyn{
	method dejaPasar(mensajero) = mensajero.peso()<=1000 && paquete.estaPagado()
}
object matrix{
	method dejaPasar(mensajero) = mensajero.puedeLlamar() && paquete.estaPagado()
}
//----------------------
object paquete{
	var property estaPagado
	var property destino
	method puedeSerEntregadoPor(mensajero) = destino.dejaPasar(mensajero)
}