class_name CharacterStateIdle extends PlayerMovementState

func enter():
	LogDuck.w("idle")
	super()
	player_node.velocity.x = 0
	_play('idle')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	super(_delta)
	player_node.move_and_slide()

func process_input(event: InputEvent):
	if Input.is_action_just_pressed("ui_up"):
		self.Transitioned.emit(self, 'playerjump')
		return
	if (Input.is_anything_pressed()):
		self.Transitioned.emit(self,'playermove')
		return
	return null
