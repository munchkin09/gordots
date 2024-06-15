class_name PlayerActionStateAttack extends PlayerActionState

func enter():
	LogDuck.w(" action attack")
	super()
	#player_node.velocity.x = 0
	#_play('idle')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	super(_delta)

func process_input(event: InputEvent):
	if Input.is_action_just_pressed("ui_attack"):
		self.ActionTransitioned.emit(self, 'playeractionstateidle')
		return
	return null
