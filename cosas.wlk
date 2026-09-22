object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
}

object arenaYGranel {
	var peso = 0
	method peso(_peso){
		peso = _peso
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method bultos() = 1
}

object bumblebee {
	var modo = robot
	method modo(_modo) {
		modo = _modo
	}
	method modo() { return modo }
	method peso() { return 800 }
	method nivelPeligrosidad() { 
	return modo.nivelPeligrosidad()
	}
	method bultos() = 2
}
object auto{
	
	method nivelPeligrosidad() { return 15 }
}
object robot{
	
	method nivelPeligrosidad() { return 30}
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0
	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}
	method peso(){
		return cantidadDeLadrillos * 2
	}
	method nivelPeligrosidad() { return 2 }
	method bultos() { 
		return if (cantidadDeLadrillos <= 100) {1}
		 else if (cantidadDeLadrillos <= 300) {2}
		 else {3} }
}

object bateriaAntiaerea{
	var tieneMisiles = false
	method cargarMisiles() {
		tieneMisiles = true
  	}
	method tieneMisiles() { return tieneMisiles }
	method descargarMisiles() {
		tieneMisiles = false
  	}
	method peso(){
		return if (tieneMisiles){
			300
		}else{ 200 }
	}
	method nivelPeligrosidad() { 
		return if (tieneMisiles) { 100 }	
				else { 0 }
	}
	method bultos() = if (tieneMisiles) {2} else {1}
}  

object residuosRadioactivos {
  var peso = 0
  method peso(_peso) {
	peso = _peso
  }
  method peso() { return peso }
  method nivelPeligrosidad() { return 200 }
  method bultos() = 2
}

object contenedorPortuario { 
	const cosas = [] 

	method cosas() = cosas 
	method agregar(unaCosa) {
		cosas.add(unaCosa) 
	}
	method quitar(unaCosa) { 
		cosas.remove(unaCosa) 
	} 
	method peso() { 
		return 100 + cosas.sum({ unaCosa => unaCosa.peso() }) 
	} 
	method nivelPeligrosidad() { 
		return if (cosas.isEmpty()) {0} else { 
			 		cosas.max({ unaCosa => unaCosa.nivelPeligrosidad() }).nivelPeligrosidad()
			 			} 
	} 	
	method bultos() = 1 + cosas.sum({ cosa => cosa.bultos() })
}

object embalajeDeSeguridad { 
	var cosaEnvuelta = null
	method cosaEnvuelta() = cosaEnvuelta 
	method envolver(unaCosa) { cosaEnvuelta = unaCosa } 
	method cosaEnvuelta(_cosa) { cosaEnvuelta = _cosa }
	method peso() {
		 return if (cosaEnvuelta != null) cosaEnvuelta.peso() else 0 
		 } 
	method nivelPeligrosidad() {
		 return if (cosaEnvuelta != null) {
			cosaEnvuelta.nivelPeligrosidad() / 2 
			}
		 else {0} 
		 } 
	method bultos() = 2
}