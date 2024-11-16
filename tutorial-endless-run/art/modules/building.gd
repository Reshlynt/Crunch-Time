extends Node3D

@onready var level = $"../../" #Get the parent level node
var speed = 10
const DELETE_POS = -15

# Modules spawn and approach the player
# After being behind the player, they can no longer be seen and are destroyed.
#func _process(delta: float) -> void:
	#if position.x < DELETE_POS:
		#level.spawnBuilding(position.x + (level.AMOUNT * level.OFFSET))
		#queue_free()
