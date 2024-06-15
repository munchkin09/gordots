class_name PlayerActionStateIdle extends PlayerActionState

func enter():
	LogDuck.w(" action idle")
	super()
	if player_node.weapon_on_hand:
		_play('idle')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	super(_delta)
	
func process_input(event: InputEvent):
	if Input.is_action_just_pressed("ui_attack"):
		self.ActionTransitioned.emit(self, 'playeractionstateattack')
		return
	return null 
