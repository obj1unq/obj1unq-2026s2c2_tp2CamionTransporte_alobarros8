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
}
