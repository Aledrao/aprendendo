extends StaticBody

const VELOCIDADE = 6
const DISTANCIA = 12

var posicao_inicial
var posicao_final
var flip = true

var t;

func _ready():
	t = get_transform()
	posicao_inicial = int(t.origin.x)
	posicao_final = posicao_inicial + DISTANCIA
	
func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		t.origin += Vector3(delta * VELOCIDADE, 0, 0)
		set_transform(t)
		if(t.origin.x >= posicao_final):
			flip = false
		
	if(t.origin.x >= posicao_inicial and !flip):
		t.origin += Vector3(-delta * VELOCIDADE, 0, 0)
		set_transform(t)
		if(t.origin.x <= posicao_inicial):
			flip = true
			
func dano():
	$".".queue_free()
