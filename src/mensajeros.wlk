object mensajeria {
	var property empleados = []
	var property paquetesEnviadosDeMensajeria = []
	var property paquetesSinEnviar = []
	var property paquetesRecibidos = []
	
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
 	method esGrandeLaMensajeria() = empleados.size()>=2
 	
 	method puedeSerEnviadoPorPrimerEmp() = paquete.puedeSerEntregadoPor(empleados.first())
 	
 	method pesoDelUltimoEmp() = empleados.last().peso()
 	
 	method puedeEntregar(paquete) = empleados.any {emp => paquete.puedeSerEntregadoPor(emp)}
 	
 	method paqueteFacil(paquete) = empleados.all({emp => paquete.puedeSerEntregadoPor(emp)})
 	
 	method candidatosParaLlevar(paquete) = empleados.filter({emp=>paquete.puedeSerEntregadoPor(emp)})
 	
 	method sobrePeso() = empleados.sum({emp=>emp.peso()})>500
 	
 	method enviarPaquete(paquete){
 		if(self.puedeEntregar(paquete)){
 			paquetesEnviadosDeMensajeria.add(paquete)
 			paquetesSinEnviar.remove(paquete)
 		}else{
 			self.error("No hay ningun mensajero disponible para enviar este paquete")
 		}
 	}
 	
 	method recibirNuevoPaquete(paquete){
 		paquetesRecibidos.add(paquete)
 		paquetesSinEnviar.add(paquete)
 	}
 	
 	method enviarTodosLosPaquetes(){
 		console.println(paquetesSinEnviar)
 		paquetesSinEnviar.forEach { pack => self.enviarPaquete(pack) }
 		 // solo si es posible entregarlo lo enviamos
 	}
 	
 	method paqueteMasCaro() = paquetesSinEnviar.max({pack => pack.precio()})
 	
 	method listadoDePaquetesEnviadosPorMensajeria() = paquetesEnviadosDeMensajeria
 	
 	method eficaciaMensajeria() = ((paquetesEnviadosDeMensajeria.size() / paquetesRecibidos.size()) * 100).roundUp()
 	// por ejemplo: pudiste enviar 10 de 20 que tenias = 0.5, multiplicado por 100 = 50% de eficacia.
 	// roundUp() para redondear y que el numero resultante sea entero.
 
	 	
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
	var property precio
	method puedeSerEntregadoPor(mensajero) = destino.dejaPasar(mensajero)
}
object paquetito{
	// paquete gratuito
	const property precio = 0
	var property destino
	const property estaPagado = true
	method puedeSerEntregadoPor(mensajero){} //polimofismo
}
object paqueton{
	const property precio = 100
	var destinos = []
	var totalPagadoDelPaquete = 0
	var property estaPagado = totalPagadoDelPaquete == destinos.size()*precio
	
	method agregarDestino(lugar){
		destinos.add(lugar)
	}
	
	method puedeSerEntregadoPor(mensajero) = destinos.all({
		dest => dest.dejaPasar(mensajero)
	})
	
	method pagoParcial(monto){
		totalPagadoDelPaquete += monto
	}
	method pagar(){
		totalPagadoDelPaquete = destinos.size() * precio
	}
}