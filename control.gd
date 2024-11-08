extends Control




func _ready():
	Reset_Timer()
	pass
	
	
	
var seconds=0
var minutes=0
var Deseconds=30
var Deminutes=1
func _on_timer_timeout():
	if seconds==0:
		if minutes>0:
			minutes-=1
			seconds=60
	seconds-=1
	
	
	
	$Label.text=String(minutes)+":"+String(seconds)
	pass # Replace with function body.



func Reset_Timer():
	seconds-Deseconds
	minutes-Deminutes
