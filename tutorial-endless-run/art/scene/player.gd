extends CharacterBody3D
var positions = [-3.1, 0, 3.1] # Valid positions to not get hit by 
var curPos = 1 # Start at the center. Keep track.
const LEFT: Vector2 = Vector2(-1,0)
const RIGHT: Vector2 = Vector2(1,0)
@onready var death_sense: RayCast3D = $DeathSense

const JUMP_VEL = 25
var grav = ProjectSettings.get_setting("physics/2d/default_gravity")

# Goal: Make discrete movements. left, right, and center.
func _physics_process(delta: float) -> void:
	_player_move()
	_jump()
	velocity.y -= grav * delta
	print_debug(velocity)
	if death_sense.is_colliding():
		_death()
	move_and_slide()

# operates player movement
func _player_move():
	# Determine what input input has just been pressed.
	if (Input.is_action_just_pressed("move_left")):
		curPos -= 1
	elif(Input.is_action_just_pressed("move_right")):
		curPos += 1
	
	# Check the boundaries. A bit archaic, but it works.
	if (curPos < 0):
		curPos += 1
	elif(curPos > 2):
		curPos -= 1
	
	# Set the z position
	position.z = positions[curPos]

func _death():
	get_tree().reload_current_scene()

# Jump.
func _jump():
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = JUMP_VEL
	
