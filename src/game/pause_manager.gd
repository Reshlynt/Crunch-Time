extends Node
@onready var TREE_NODE = get_tree()

func _process(delta: float) -> void:
	revealPause()

func revealPause():
	if Input.is_action_just_pressed("Pause"):
		$resumebuttonsound.play()
		TREE_NODE.paused = true
		%GreyOverlay.visible = true
		%pauseMenu.visible = true
	
func revealDeath():
	TREE_NODE.paused = true
	%GreyOverlay.visible = true
	%deathScene.visible = true

# Acquires signal from player on death.
func _on_player_defeat() -> void:
	revealDeath()
