class_name SelectLevelState extends BaseStateClass

var current_scene: Node2D
var initial_node: Node2D
var path = 'res://src/Scenes/Level1/World.tscn'

func enter():
	goto_scene()

func goto_scene():
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	if current_scene:
		# It is now safe to remove the current scene
		current_scene.free()

	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	current_scene.add_to_group('current_scene', false)
	initial_node.get_tree().get_root().add_child(current_scene)
	initial_node.get_tree().get_first_node_in_group('current_scene')
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	initial_node.get_tree().set_current_scene(current_scene)
	self.Transitioned.emit(self, 'startlevelstate')

func setInitial(node: Node2D):
	initial_node = node

func process(delta):
	pass

func physics_process(delta):
	pass
