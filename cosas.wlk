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

object bumbleblee {
	var modo = "robot"
	method modo(_modo) {
		modo = _modo
	}
	method modo() { return modo }
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return if (modo == "robot") {30}	
				else {15}
		 }

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
	method tieneMisiles(_tieneMisiles) {
		tieneMisiles = _tieneMisiles
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