extends Node3D

@onready var carAnim = $model/AnimationPlayer
 
var anims = ["Drive", "Drive", "Drive", "Drive", "Drive", "Drive", "DriveFast", "DriveFast", "DriveFast", "DriveFast", "SpinOut"]


func _ready() -> void:

	carAnim.play(anims[randi() % anims.size()])
