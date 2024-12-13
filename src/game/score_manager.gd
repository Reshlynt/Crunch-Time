extends Node

var score = 0

func updateScore():
	score += 1
	%ScoreText.textUpdate("Score: " + str(score))
	
