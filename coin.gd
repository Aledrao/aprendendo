extends Area

var basis = Basis()

func _ready():
	pass
	
func _physics_process(delta):
	rotate_y(deg2rad(4))
