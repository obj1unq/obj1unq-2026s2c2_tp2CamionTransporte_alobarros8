import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosas.add(unaCosa)
	}
	method validarCargar(unaCosa){
		return if (cosas.contains(unaCosa)){
			self.error("La unaCosa ya se encuentra cargada")
		} 
	}
	method descargar(unaCosa){
		self.validarDescargar(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarDescargar(unaCosa){
		return if (!cosas.contains(unaCosa)){
			self.error("La unaCosa no se encuentra cargada")
		} 
	}
	method peso(){
		var pesoTotal = 0
		cosas.forEach({unaCosa => pesoTotal += unaCosa.peso()})
		return pesoTotal + 1000 //1000 peso de camion vacio 
	}

	method estaExcedidoDePeso(){
		return self.peso() > 2500
	}
	method cadaUnaDeLasCosasTienePesoPar(){
		return cosas.all({unaCosa => unaCosa.peso() % 2 == 0})
	}

	method hayUnaCosaQuePesa(peso){
		return cosas.any({unaCosa => unaCosa.peso() == peso})
	}
	
	method unaCosaConNivelDePeligrosidad(nivel){
		return if(cosas.any({unaCosa => unaCosa.nivelPeligrosidad() == nivel})){
					cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() == nivel}).asList().first()
				}
				else{
					self.error("No hay ninguna unaCosa con ese nivel de peligrosidad")
				}
		}		

	method cosasQueSuperanNivelDePeligrosidad(nivel){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQue(unaCosa){
		return self.cosasQueSuperanNivelDePeligrosidad(unaCosa.nivelPeligrosidad())
	}

	method puedeCirularEnRutaConNivel(nivel){
		return !self.estaExcedidoDePeso() && self.cosasQueSuperanNivelDePeligrosidad(nivel).size() == 0
	}

	method tieneAlgoQuePesaEntre(min, max) { 
		return cosas.any({ unaCosa => unaCosa.peso().between(min, max) }) 
		}

	method cosaMasPesada() {
		 return if(cosas.isEmpty()) {
			self.error("No hay ninguna cosa cargada")
		 } else {
			cosas.max({ cosa => cosa.peso() })
		 }
	}

	method pesosDeCosas() {
		return cosas.map({unaCosa => unaCosa.peso()})
	}
}
