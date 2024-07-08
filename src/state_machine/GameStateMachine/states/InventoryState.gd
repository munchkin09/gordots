class_name InventoryState extends BaseStateClass

var InventoryMenu 
var root_node: Node2D
var paused

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func configure(node: Node2D):
	root_node = node
	
func enter():
	Log.call("Greetings from pause")
	InventoryMenu = root_node.get_tree().get_first_node_in_group('current_scene').get_node("InventoryMenu")
	paused = true
	InventoryMenu.show()
	InventoryMenu.get_node("InventoryGridContainer").show()
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func exit():
	paused = false
	InventoryMenu.get_node("InventoryGridContainer").hide()
	InventoryMenu.hide()
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func process(_delta):
	if Input.is_action_just_pressed('ui_inventory'):
		Transitioned.emit(self, 'startlevelstate')

func physics_process(_delta):
	pass
