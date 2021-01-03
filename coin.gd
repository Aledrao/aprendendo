extends Area

const TIME_PERIOD = 1

var basis = Basis()
var time = 0
var death = false

func _ready():
	pass
	
func _physics_process(delta):
	if(death):
		time += delta
	elif(!death):
		time = 0
	rotate_y(deg2rad(4))
	
	if(death and time > TIME_PERIOD):
		$".".queue_free()
		$Particles.emitting = false
	
func catch_coin():
	$Particles.emitting = true
	$MeshInstance.visible = false
	$CollisionShape.visible = false
	$CollisionShape.disabled = true
	death = true
