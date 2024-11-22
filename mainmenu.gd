extends Control



func _on_play_poc_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial-endless-run/art/scene/main.tscn")
	


func _on_play_demo_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/field.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
