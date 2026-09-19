import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosas.add(unaCosa)
	}
	method validarCargar(unaCosa){
		return if (cosas.contains(unaCosa)){
			self.error("La cosa ya se encuentra cargada")
		} 
	}
	method descargar(unaCosa){
		self.validarDescargar(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarDescargar(unaCosa){
		return if (!cosas.contains(unaCosa)){
			self.error("La cosa no se encuentra cargada")
		} 
	}
	method peso(){
		var pesoTotal = 0
		cosas.forEach({cosa => pesoTotal += cosa.peso()})
		return pesoTotal + 1000 //1000 peso de camion vacio 
	}

	method estaExcedidoDePeso(){
		return self.peso() > 2500
	}
	method cadaUnaDeLasCosasTienePesoPar(){
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayUnaCosaQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
	
	method unaCosaConNivelDePeligrosidad(nivel){
		return if(cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})){
					cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel}).asList().first()
				}
				else{
					self.error("No hay ninguna cosa con ese nivel de peligrosidad")
				}
		}		

	method cosasQueSuperanNivelDePeligrosidad(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQue(unaCosa){
		return self.cosasQueSuperanNivelDePeligrosidad(unaCosa.nivelPeligrosidad())
	}

	method puedeCirularEnRutaConNivel(nivel){
		return !self.estaExcedidoDePeso() && self.cosasQueSuperanNivelDePeligrosidad(nivel).size() == 0
	}
}
