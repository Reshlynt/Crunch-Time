extends Node3D

@onready var level = $"../" #Get the parent level node
@export var buildings: Array[PackedScene] = [] #Stores all modules for use in generation.
@export var obstacles: Array[PackedScene] = [] #Stores all obstacles to spawn
var speed = 10
var rng = RandomNumberGenerator.new()
const CAMERA_POS = -20
var obstacleSpawn = false
var positions = [-2.5, 0, 2.5] # Valid positions to not get hit by 

# Error discovered: Spawn buildings in the level manager is a bad idea.
# Buildings are not part of the obstacle that a player should avoid, they are natually
# part of a module and thus
func _ready() -> void:
	#spawnBuilding()
	spawnObstacle()
	pass

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
	
	rng.randomize()
	var sec_num = rng.randi_range(0, buildings.size() - 1)
	var sec_instance = buildings[sec_num].instantiate()
	sec_instance.position.z = -7.3
	add_child(sec_instance)

# Spawns an obstacle on the road for the player to avoid.
func spawnObstacle():
	rng.randomize()
	var num = rng.randi_range(0, obstacles.size() - 1)
	var instance = obstacles[num].instantiate()
	rng.randomize()
	num = rng.randi_range(0, positions.size() - 1)
	instance.position.z = positions[num]
	add_child(instance)

func _on_level_spawn_obstacles(_positions) -> void:
	obstacleSpawn = true
