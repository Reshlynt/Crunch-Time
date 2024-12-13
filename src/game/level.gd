extends Node3D

@export var modules: Array[PackedScene] = [] #Stores all modules for use in generation.
const AMOUNT: int = 25  # How many in a given scene
var rng = RandomNumberGenerator.new()
var OFFSET = 5 #Does not spawn on top of each other.

# signal for the grace period to be over to spawn obstacles
var initObstacle = 0


func _ready() -> void:
	for n in AMOUNT:
		spawnModule(n*OFFSET)

# Spawns the road
# First if block offers a grace period to prepare the player for the game
func spawnModule(n):
	if initObstacle < 8:
		var instance = modules[1].instantiate()
		instance.position.x = n
		add_child(instance)
		initObstacle += 1
	else:
		var instance = modules[0].instantiate()
		instance.position.x = n
		add_child(instance)
