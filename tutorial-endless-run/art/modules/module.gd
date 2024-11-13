extends Node3D


@onready var level = $"../" #Get the parent level node
var speed = 10
const CAMERA_POS = -15

# Modules spawn and approach the player
# After being behind the player, they can no longer be seen and are destroyed.
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < CAMERA_POS:
		level.spawnModule(position.x + (level.AMOUNT * level.OFFSET))
		queue_free()
