extends SpringArm3D

const ZOOM_INC = 1

const MAX_ZOOM_NEAR = 1
const MAX_ZOOM_FAR = 8

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
		tween.tween_property(self,"rotation:y", 0, 0.5)
		

func handle_zoom():
	if Input.is_action_just_pressed("zoom_in") and spring_length >= MAX_ZOOM_NEAR:
		
		# TODO might need to tone down this value
		var newlength = spring_length - ZOOM_INC
		
		# make sure that it doesn't go out of bounds
		if newlength < MAX_ZOOM_NEAR: newlength = MAX_ZOOM_NEAR
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"spring_length",
			newlength,
			0.5
		)
	elif Input.is_action_just_pressed("zoom_out") and spring_length < MAX_ZOOM_FAR:
		
		var newlength = spring_length + ZOOM_INC
		
		# make sure that it doesn't go out of bounds
		if newlength >= MAX_ZOOM_FAR: newlength = MAX_ZOOM_FAR
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
			self,
			"spring_length",
			newlength,
			0.5
		)
