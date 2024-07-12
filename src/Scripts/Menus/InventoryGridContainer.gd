class_name InventoryGridContainer extends GridContainer

@onready var inventory 
@onready var slots : Array

func _ready():
	slots = get_children()
	
func _on_canvas_layer_visibility_changed():
	inventory = GameStateMachine.items_controller.get_inventory()
	var counter = 0
	for weapon in inventory["weapons"]:
		slots[counter].get_node("TextureRect").texture = inventory["weapons"][weapon].equipped_texture 
		counter =+ 1
