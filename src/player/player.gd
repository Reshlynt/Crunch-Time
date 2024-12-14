extends CharacterBody3D
var positions = [-2.5, 0, 2.5] # Valid positions
var curPos = 1 # Start at the center. Keep track.
const LEFT: Vector2 = Vector2(-1,0)
const RIGHT: Vector2 = Vector2(1,0)

@onready var death_ground: RayCast3D = $DeathSense2

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak)
@onready var jump_gravity : float = ((2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak))
@onready var fall_gravity : float = ((2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent))

signal you_died

# Goal: Make discrete movements. left, right, and center.
func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity.y -= _get_gravity() * delta
	player_move(delta)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
		$"%JumpButton".play()
	if death_ground.is_colliding():
		you_died.emit()

# operates player movement
func player_move(delta: float):
	# Determine what input input has just been pressed.
	if (Input.is_action_just_pressed("move_left")):
		curPos -= 1
		$LeftButton.play()
	elif(Input.is_action_just_pressed("move_right")):
		curPos += 1
		$RightButton.play()
	# Restrain to boundaries. A bit archaic, but it works.
	if (curPos < 0):
		curPos += 1
	elif(curPos > 2):
		curPos -= 1
	
	# Set the z position via linear interpolation
	position.z = lerpf(position.z, positions[curPos], delta*20)

# Return gravity
func _get_gravity() -> float:
	return jump_gravity if velocity.y > 0.0 else fall_gravity

# Allow jumping
func jump():
	velocity.y = jump_velocity


func _on_death_sense_body_entered(body: Node3D) -> void:
	if body.is_in_group("obstacle"):
		you_died.emit()
