class_name CharacterStateIdle extends PlayerState

func enter():
	super()
	player_node.velocity.x = 0
	_play('idle')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	super(_delta)

	if Input.is_action_just_pressed("ui_up"):
		self.Transitioned.emit(self, 'characterstatejump')

	if (Input.is_anything_pressed()):
		self.Transitioned.emit(self,'characterstatemove')
	player_node.move_and_slide()
