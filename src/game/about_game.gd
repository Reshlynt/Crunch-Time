extends Control


func _on_backto_main_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/mainmenu.tscn")
