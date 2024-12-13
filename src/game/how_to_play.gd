extends Control



func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/mainmenu.tscn")
