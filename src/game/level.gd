extends Node3D

@export var modules: Array[PackedScene] = [] #Stores all modules for use in generation.
const AMOUNT: int = 30  # How many in a given scene
var rng = RandomNumberGenerator.new()
var OFFSET = 5 #Does not spawn on top of each other.

# signal for the grace period to be over to spawn obstacles
var initObstacle = 0
signal spawn_obstacles(positions)


func _ready() -> void:
	for n in AMOUNT:
		spawnModule(n*OFFSET)
		if n == AMOUNT/2:
			spawn_obstacles.emit()
		

# Spawns the road
func spawnModule(n):
		var instance = modules[0].instantiate()
		instance.position.x = n
		add_child(instance)
