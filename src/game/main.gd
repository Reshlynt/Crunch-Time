extends Node3D

@onready var pause_menu = $pauseMenu
var pause = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()

func pauseMenu():
	if pause:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	pause = !pause
	
