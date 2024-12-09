extends CharacterBody3D


const SPEED = 2.5
const JUMP_VELOCITY = 4.5

const RUN_FRAMES = 8
const WALK_FRAMES = 12


var RUN_SHEET = load("res://spritesheets/characters/Hero/HeroRun.png")
var MAIN_SHEET = load("res://spritesheets/characters/Hero/HeroMain.png")

@export var animation_frame = 0
var anim_row = 0

var running = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

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
	var direction = ($CameraArm.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	handle_walk_animation(input_dir)
	
	move_and_slide()



# A modified version of the animation function in this tutorial
# 
# 	https://www.youtube.com/watch?v=ZM9e2yKaybg
# 
# Unfortunately I had to make it a bit more complicated because I had to switch
# sprite sheets for the idle.
# 
# It works by exporting the variable animation_frame to the Animation player.
# All the player does is just loop the int between 0 and 7
# With that, we can do a little bit of math to "select" which row we want to
# use by multiplying that number by the row
func handle_walk_animation(direction: Vector2):

	# Start and Stop animation based on input
	if running and direction == Vector2(0,0):
		# No longer running
		running = false
		
		# Stop the animation player and reset back to 0th frame
		$AnimationPlayer.stop()
		
		# Set the texture and sprite to Hero's first sprite sheet
		$Sprite3D.texture = MAIN_SHEET
		$Sprite3D.hframes = 12
		$Sprite3D.vframes = 8
		
		# Offset the frame by 1 since his idles are on the 2nd column
		animation_frame = 1
		
		# Multiply by the row still to preserve the direction
		$Sprite3D.frame = animation_frame + (anim_row * WALK_FRAMES)
	elif !running and direction != Vector2(0,0):
		# We started running!
		running = true
		
		# Swap spritesheets
		$Sprite3D.texture = RUN_SHEET
		$Sprite3D.hframes = 8
		$Sprite3D.vframes = 4
		
		# reset the animation_frame to 0 so the walk cycle can start at the right place
		animation_frame = 0
		$AnimationPlayer.play("run")
	
	
	# since there is no idle, this only need to execute when running
	if running:
		# note that in the case of diagonals, y would take priority.
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
