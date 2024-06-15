class_name CharacterStateJump extends PlayerMovementState

func enter():
	LogDuck.w("jump")
	super()
	player_node.velocity.y = JUMP_VELOCITY
	player_node.move_and_slide()
	_play('jump')

func exit():
	pass

func process(_delta):
	pass

func physics_process(delta):
	super(delta)	
	if player_node.is_on_floor():
		self.Transitioned.emit(self, 'playeridle')
		return
	self._direction(delta)
	player_node.move_and_slide()
