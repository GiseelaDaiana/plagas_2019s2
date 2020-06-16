import plagas.*
class Hogar {
	var property nivelDeMugre = 0
	var property confort = 0
	method esBueno(){
		return nivelDeMugre <= (confort /2)
	}
	method efectoDeAtaque(plaga){
	   nivelDeMugre = nivelDeMugre + plaga.nivelDeDano()
	}
	
}
class Huerta {
	var property nivel
	var property capacidadDeProduccionXMes = 0
	method esBueno(){
	  return capacidadDeProduccionXMes > nivel	
	}
	method efectoDeAtaque(plaga){
		if (plaga.trasmiteEnfermedades()){
		capacidadDeProduccionXMes =capacidadDeProduccionXMes - (plaga.nivelDeDano()/10) - 10
		}else{
		capacidadDeProduccionXMes = capacidadDeProduccionXMes - (plaga.nivelDeDano()/10 )
		}
	}
}
class Mascota {
	 var property nivelDeSalud 
	 method esBueno(){
	  return nivelDeSalud > 250
	 }
	 method efectoDeAtaque(plaga){
		 if (plaga.trasmiteEnfermedades()){
			 nivelDeSalud = nivelDeSalud -  plaga.nivelDeDano()
		}
	}		
}
class Barrios {
	var elementos = []
	
	method agregarElemento(elemento){
		elementos.add(elemento)
	}
	method barrioCopado(){
		return self.elementosDelBarrioBuenos() > self.elementosDelBarrioMalos()
		
	}
	method atacarBarrio(plaga){
		elementos.forEach({elemento => elemento.efectoDeAtaque(plaga)})
	}
	method elementosDelBarrioBuenos(){
		return elementos.count({ elemento => elemento.esBueno()})
	}
	method elementosDelBarrioMalos(){
		return elementos.count({ elemento =>  not elemento.esBueno()})
	}
}