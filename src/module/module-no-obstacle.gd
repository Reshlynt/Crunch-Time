extends Node3D

@onready var level = $"../" #Get the parent level node
@export var buildings: Array[PackedScene] = [] #Stores all modules for use in generation.
var speed = 10
var rng = RandomNumberGenerator.new()
const CAMERA_POS = -20
var obstacleSpawn = false
var positions = [-2.5, 0, 2.5] # Valid positions (from player)

func _ready() -> void:
	#spawnBuilding()
	pass
	

# Modules spawn and approach the player
# After being behind the player, they can no longer be seen and are destroyed.
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < CAMERA_POS:
		level.spawnModule(position.x + (level.AMOUNT * level.OFFSET))
		queue_free()

# Spawns a random building on both sides of the road.
func spawnBuilding():
	rng.randomize()
	var num = rng.randi_range(0, buildings.size() - 1)
	var instance = buildings[num].instantiate()
	instance.position.z = 7.3
	add_child(instance)
	
	rng.randomize()
	var sec_num = rng.randi_range(0, buildings.size() - 1)
	var sec_instance = buildings[sec_num].instantiate()
	sec_instance.position.z = -7.3
	add_child(sec_instance)
