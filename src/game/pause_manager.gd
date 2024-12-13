extends Node
@onready var TREE_NODE = get_tree()

func _process(delta: float) -> void:
	revealPause()

func revealPause():
	if Input.is_action_just_pressed("Pause"):
		$resumebuttonsound.play()
		%pauseMenu.visible = true
		TREE_NODE.paused = true
	
func revealDeath():
	%deathScene.visible = true
	TREE_NODE.paused = true


func _on_player_you_died() -> void:
	revealDeath()
