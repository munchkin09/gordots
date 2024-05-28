class_name StartLevelState extends BaseStateClass

func enter():
	Log.call('Greetings from start level!')
	Transitioned.emit(self, 'playinglevelstate')

func exit():
	pass

func process(_delta):
	if Input.is_action_pressed('ui_menu'):
		Transitioned.emit(self, 'pausestate')

func physics_process(_delta):
	pass
