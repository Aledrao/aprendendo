extends StaticBody

const VELOCIDADE = 6
const DISTANCIA = 12
const TIME_PERIOD = 1

var posicao_inicial
var posicao_final
var flip = true
var time = 0
var dealth = false

var t;

func _ready():
	t = get_transform()
	posicao_inicial = int(t.origin.x)
	posicao_final = posicao_inicial + DISTANCIA
	
func _process(delta):
	if(dealth):
		time += delta
	else:
		time = 0
		
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

	if(dealth and time > TIME_PERIOD):
		$".".queue_free()

func dano():
	$MeshInstance.visible = false
	$CollisionShape.disabled = true
	$Particles.emitting = true
	dealth = true
