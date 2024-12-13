extends Control



# Resumes the game
func _on_resume_pressed() -> void:
	%pauseMenu.visible = false
	%GreyOverlay.visible = false
	get_tree().paused = false

# Returns to the main menu
func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/mainmenu.tscn")

# Quits application
func _on_quit_pressed() -> void:
	get_tree().quit()
