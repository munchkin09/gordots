class_name CharacterStateMove extends PlayerState

func enter():
	LogDuck.d('Greeting from move!!')
	player_node.animated_sprite.play("run")

func physics_process(delta):
	self._gravity(delta)
	if not Input.is_anything_pressed():
		self.Transitioned.emit(self, 'characterstateidle')
		return

	if Input.is_action_just_pressed("ui_up"):
		self.Transitioned.emit(self, 'characterstatejump')
		return

	self._direction(delta)

	player_node.move_and_slide()
