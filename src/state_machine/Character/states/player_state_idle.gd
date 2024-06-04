class_name CharacterStateIdle extends PlayerState

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

	if Input.is_action_just_pressed("ui_up"):
		self.Transitioned.emit(self, 'characterstatejump')
		return
	if (Input.is_anything_pressed()):
		self.Transitioned.emit(self,'characterstatemove')
		return
	player_node.move_and_slide()
