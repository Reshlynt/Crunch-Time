extends SpringArm3D

@export var zoom_inc = 1

const ZOOM_NEAR = 1
const ZOOM_FAR = 4

func _physics_process(delta: float) -> void:
	handle_camera()
	handle_zoom()

func handle_camera():
	if Input.is_action_just_pressed("rotate_left"):
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"rotation:y",
			self.rotation.y + PI/2,
			0.5
		)
	elif Input.is_action_just_pressed("rotate_right"):
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"rotation:y",
			self.rotation.y - PI/2,
			0.5
		)
	# reset
	elif (Input.is_action_pressed("rotate_right") and
		  Input.is_action_pressed("rotate_left")):
	
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"rotation:y", PI, 0.5)
		

func handle_zoom():
	if Input.is_action_just_pressed("zoom_in") and spring_length >= ZOOM_NEAR:
		
		# TODO might need to tone down this value
		var newlength = spring_length - zoom_inc
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"spring_length",
			newlength,
			0.5
		)
	elif Input.is_action_just_pressed("zoom_out") and spring_length < ZOOM_FAR:
		
		# TODO might need to tone down this value
		var newlength = spring_length + zoom_inc
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"spring_length",
			newlength,
			0.5
		)
