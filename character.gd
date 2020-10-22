extends KinematicBody

const UP = Vector3(0, 1, 0)
const GRAVITY = 8
const SPEEDY = 15
const JUMP_HEIGHT = 80

var motion = Vector3()
var jump = false

func _ready():
	pass
	
func _physics_process(delta):
	motion.y -= GRAVITY
	
	if(Input.is_action_pressed("ui_right")):
		motion.x = SPEEDY
	elif(Input.is_action_pressed("ui_left")):
		motion.x = -SPEEDY
	elif(Input.is_action_pressed("ui_down")):
		motion.z = SPEEDY
	elif(Input.is_action_pressed("ui_up")):
		motion.z = -SPEEDY
		
	else:
		motion.x = 0
		motion.z = 0
		
	if(is_on_floor()):
		if(Input.is_action_pressed("ui_jump") && !jump):
			motion.y = JUMP_HEIGHT
			jump = true
	if(Input.is_action_just_released("ui_jump") && jump):
		jump = false
		
	move_and_slide(motion, UP)
