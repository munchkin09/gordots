class_name CharacterStateJump extends PlayerState

func enter():
	LogDuck.d('Welcome to the Jump!')
	player_node.velocity.y = JUMP_VELOCITY

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	if player_node.is_on_floor():
		self.Transitioned.emit(self, 'characterstateidle')
		return

	self._gravity(delta)
	self._direction(delta)

	player_node.move_and_slide()
