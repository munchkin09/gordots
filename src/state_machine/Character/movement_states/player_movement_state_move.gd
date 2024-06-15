class_name CharacterStateMove extends PlayerMovementState

func enter():
	super()
	_play('roll')
	# player_node.animated_sprite.play('run')

func physics_process(delta):
	super(delta)
	self._direction(delta)
	player_node.move_and_slide()

func process_input(event: InputEvent):
	if not Input.is_anything_pressed():
		self.Transitioned.emit(self, 'playeridle')
		return

	if Input.is_action_just_pressed("ui_up"):
		self.Transitioned.emit(self, 'playerjump')
		return
	return null
