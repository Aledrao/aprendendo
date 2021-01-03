extends KinematicBody

const UP = Vector3(0, 1, 0)
const GRAVITY = 8
const SPEEDY = 15
const JUMP_HEIGHT = 80
const JUMP_HEIGHT_DIE = 65
const DAMAGE_CHARACTER = 50
const TIME_PERIOD = 5.5

var motion = Vector3()
var jump = false
var coin = 0
var touch = false;
var time = 0

func _ready():
	pass
	
func _physics_process(delta):
	if(touch):
		time += delta
	else:
		time = 0
		
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
		
	if(touch and time > TIME_PERIOD):
		print("DEPOIS AQUI")
		motion.z = 0
		touch = false
		time = 0
		
	move_and_slide(motion, UP)

func _on_money_area_entered(area):
	coin = coin + 1
	area.catch_coin()
	print("moedas: ", coin)

func _on_foot_body_entered(body):
	motion.y = JUMP_HEIGHT_DIE
	body.dano()


func _on_damage_body_entered(body):
	print("PASSOU AQUI")
	motion.z = DAMAGE_CHARACTER
	touch=true
	#$".".queue_free()
