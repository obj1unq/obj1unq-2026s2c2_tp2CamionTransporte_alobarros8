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
	/*method peso(){
		var pesoTotal = 0
		cosas.forEach({cosa => pesoTotal += cosa.peso()})
		return pesoTotal
	}*/

	method cadaUnaDeLasCosasTienePesoPar(){
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}
}
