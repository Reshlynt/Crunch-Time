extends Control



func _on_play_poc_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial-endless-run/art/scene/main.tscn")
	


func _on_play_demo_pressed() -> void:
	get_tree().change_scene_to_file("res://field/scenes/maps/field.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_about_game_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial-endless-run/art/scene/about_game.tscn")


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial-endless-run/art/scene/how_to_play.tscn")