extends Node3D

@onready var level = $"../" #Get the parent level node
@export var buildings: Array[PackedScene] = [] #Stores all modules for use in generation.
var speed = 10
var rng = RandomNumberGenerator.new()
const CAMERA_POS = -20

# Error discovered: Spawn buildings in the level manager is a bad idea.
# Buildings are not part of the obstacle that a player should avoid, they are natually
# part of a module and thus
func _ready() -> void:
	spawnBuilding()

# Modules spawn and approach the player
# After being behind the player, they can no longer be seen and are destroyed.
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < CAMERA_POS:
		level.spawnModule(position.x + (level.AMOUNT * level.OFFSET))
		queue_free()

func spawnBuilding():
	rng.randomize()
	var num = rng.randi_range(0, buildings.size() - 1)
	var instance = buildings[num].instantiate()
	instance.position.z = 7.3
	add_child(instance)
	
	# One side is adequete, but once it constructs the other, it becomes erratic.
	rng.randomize()
	var sec_num = rng.randi_range(0, buildings.size() - 1)
	var sec_instance = buildings[sec_num].instantiate()
	sec_instance.position.z = -7.3
	add_child(sec_instance)
