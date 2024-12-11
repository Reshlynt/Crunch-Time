extends Node3D

@onready var carAnim = $model/AnimationPlayer

func _ready() -> void:
	carAnim.play("Drive")
