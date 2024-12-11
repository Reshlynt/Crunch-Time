extends Control



func _on_play_poc_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/game/main-game.tscn")
	


func _on_play_demo_pressed() -> void:
	get_tree().change_scene_to_file("res://billboard/scenes/maps/field.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
