extends Control

#The variable for score that starts at 0
var score = 0
#Ties in witht the score label
@onready var scoreLabel = $Score

#Recognizes and calls script
func _ready():
	pass
	
#A process that increments the score variable by one
func _process(delta):
	score += 1
	scoreLabel.text = "Score: %dm" % score
	
	#Resource: Your First Game in Godot 4 Part 12 - Creating Score System 
	#by TheYellowDude
