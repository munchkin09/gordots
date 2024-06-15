class_name PlayerActionStateIdle extends PlayerActionState

func enter():
	LogDuck.w(" action idle")
	super()
	_play('idle')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	if Input.is_action_just_pressed("ui_attack"):
		self.ActionTransitioned.emit(self, 'playeractionstateattack')
		return
	super(_delta)
	

