class_name StartLevelState extends BaseStateClass

func enter():
	Log.call('Greetings from start level!')

func exit():
	pass

func process(delta):
	LogDuck.d(Input.is_action_pressed('ui_menu'))
	if Input.is_action_pressed('ui_menu'):
		Transitioned.emit(self, 'pausestate')

func physics_process(delta):
	pass
