extends Node3D

@export var modules: Array[PackedScene] = [] #Stores all modules for use in generation.
const AMOUNT: int = 30  # How many in a given scene
var rng = RandomNumberGenerator.new()
var OFFSET = 5 #Does not spawn on top of each other.

var initObstacle = 0
# Error: offset has to match how many elements are in your array.
func _ready() -> void:
	for n in AMOUNT:
		spawnModule(n*OFFSET)
		#spawnBuilding(n*OFFSET)

# Spawns a module
# It will first provide an empty beginning space for the player to become
# ready for the obstacles to come. Once the grace period is over, the obstacles start spawning.
func spawnModule(n):
	if initObstacle > 10:
		rng.randomize()
		var num = rng.randi_range(0, modules.size() - 1)
		var instance = modules[num].instantiate()
		instance.position.x = n
		add_child(instance)
	else:
		var instance = modules[4].instantiate()
		instance.position.x = n
		add_child(instance)
		initObstacle += 1

#func spawnBuilding(n):
	#rng.randomize()
	#var num = rng.randi_range(0, buildings.size() - 1)
	#var instance = buildings[num].instantiate()
	#instance.position.x = n
	#instance.position.z = 7.3
	#add_child(instance)
	#
	## One side is adequete, but once it constructs the other, it becomes erratic.
	#rng.randomize()
	#var sec_num = rng.randi_range(0, buildings.size() - 1)
	#var sec_instance = buildings[sec_num].instantiate()
	#sec_instance.position.x = n
	#sec_instance.position.z = -7.3
	#add_child(sec_instance)
