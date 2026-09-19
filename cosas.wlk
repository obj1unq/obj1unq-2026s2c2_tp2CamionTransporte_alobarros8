object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaYGranel {
	var peso = 0
	method peso(_peso){
		peso = _peso
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
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
}

object bateriaAntiaerea{
	var tieneMisiles = false
	method cargarMisiles() {
		tieneMisiles = true
  	}
	method tieneMisiles() { return tieneMisiles }
	method peso(){
		return if (tieneMisiles){
			300
		}else{ 200 }
	}
	method nivelPeligrosidad() { 
		return if (tieneMisiles) { 100 }	
				else { 0 }
	}
}  

object residuosRadioactivos {
  var peso = 0
  method peso(_peso) {
	peso = _peso
  }
  method peso() { return peso }
  method nivelPeligrosidad() { return 200 }
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
}