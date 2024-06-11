class_name GameOverState extends BaseStateClass

var root_node : Node2D

func configure(node : Node2D):
	root_node = node

func enter():
	Log.call("Greeting from Game Over State")
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = true
		
func _process(delta):
	pass
	
func exit():
	pass
