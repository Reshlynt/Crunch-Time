extends Control

# Return to main game.
func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

# Returns to meWnu
func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/game/mainmenu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
