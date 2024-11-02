extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var animation_frame = 0
const RUN_FRAMES = 8



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func handle_walk_animation(direction):
	
	# TODO note that Hero's idle is on a seperate spritesheet! F you Omori devs!

	# Start and Stop animation based on input
	if direction == Vector2(0,0):
		$AnimationPlayer.stop()
		animation_frame = 0
	else:
		$AnimationPlayer.play("walk")
	
	
	var anim_row
	
	# Set anim_row and Horizontal Flip depending on input direction
	# (Note that *I* don't need to horizontal flip)
	if direction.y == 1: # Move Down
		anim_row = 0
	elif direction.y == -1: # Move Up
		anim_row = 3
	elif direction.x == -1: # Move Left
		anim_row = 1
	elif direction.x == 1:  # Move Right
		anim_row = 2
	
	# Update the frames based on the row and the int animation
	$Sprite3D.frame = animation_frame + (anim_row * RUN_FRAMES)

func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
