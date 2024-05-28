class_name StartLevelState extends BaseStateClass

func enter():
	Log.call('Greetings from start level!')
	Transitioned.emit(self, 'playinglevelstate')

func exit():
	pass

func process(_delta):
	pass

func physics_process(_delta):
	pass
