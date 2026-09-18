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
	
	method hayUnaCosaConNivelDePeligrosidad(nivel){
		return cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})
	}
}
