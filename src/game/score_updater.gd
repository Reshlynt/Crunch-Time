extends Control

@onready var label = $Label

func textUpdate(txt: String):
	label.text = txt
