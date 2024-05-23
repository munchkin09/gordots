class_name PauseState extends BaseStateClass

var root_node: Node2D
var paused
func enter():
	Log.call("Greetings from pause")
	paused = true
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func exit():
	paused = false
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func process(delta):
	Log.call("EOEOEO")
	if Input.is_action_pressed('ui_menu'):
		Transitioned.emit(self, 'startlevelstate')

func physics_process(delta):
	pass
