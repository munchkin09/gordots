class_name PlayingLevelState extends BaseStateClass

func enter():
	pass

func exit():
	pass

func process(_delta):
	if Input.is_action_pressed('ui_menu'):
		Transitioned.emit(self, 'pausestate')

func physics_process(_delta):
	pass
