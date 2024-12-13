extends Control




func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_about_game_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/game/about_game.tscn")


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/game/how_to_play.tscn")

# Loads the game
func _on_play_game_pressed() -> void:
	get_tree().change_scene_to_file("res://game-scene/game/main-game.tscn")
