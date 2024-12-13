extends Control




func _ready():
	Reset_Timer()
	pass
	

var seconds=0
var minutes=0
var Dseconds=0
var Dminutes=0
func _on_timer_timeout() -> void:
		if seconds==0:
			if minutes>0:
					minutes-=1
					seconds=60
		seconds +=1
		$Label.text = String("%02d:%02d" % [minutes, seconds])
		pass # Replace with function body.
		
func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes
	
