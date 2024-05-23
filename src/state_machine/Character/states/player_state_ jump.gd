class_name CharacterStateJump extends PlayerState

func enter():
	super()
	player_node.velocity.y = JUMP_VELOCITY
	_play('jump')

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	super(delta)
	if player_node.is_on_floor():
		self.Transitioned.emit(self, 'characterstateidle')
		return

	self._direction(delta)

	player_node.move_and_slide()
