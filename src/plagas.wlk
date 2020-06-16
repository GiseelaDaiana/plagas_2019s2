import elementos.*
class Plaga {
	var property poblacion
	method trasmiteEnfermedades(){
		return  poblacion > 10
	}
	method nivelDeDano(){
		return poblacion 
	}
	method atacarA(elemento){
		elemento.efectoDeAtaque(self)
		self.efectoDeAtaque()
	}
	method efectoDeAtaque(){
		poblacion = poblacion + (poblacion *10 /100)
	}
}

class Cucarachas inherits Plaga {
	var property pesoPromedioDeBichos
	
	 override method trasmiteEnfermedades(){
		return super() and pesoPromedioDeBichos >= 10 
	}
	override method nivelDeDano(){
		return super() /2
	}
	override method efectoDeAtaque(){
		pesoPromedioDeBichos = pesoPromedioDeBichos + 2
		super()
	}
}

class Pulgas inherits Plaga {
	
	override method nivelDeDano(){
		return super()*2
	}
}
class Mosquitos inherits Plaga {
	override  method trasmiteEnfermedades(){
		return super() and  poblacion % 3 == 0
 }
}
class Garrapatas inherits Pulgas {
	override method efectoDeAtaque(){
		poblacion = poblacion + (poblacion *20/100) 
	}
}
	
