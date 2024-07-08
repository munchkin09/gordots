class_name ItemsController extends Node

const INITIAL_COINS = 0
var actual_coins = INITIAL_COINS

var inventory  := {
	"weapons" : {},
	"coins"	  : 0
}

var active_item: Item
const logDuckHeader = '😷 '

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	Log.call('Initiated')
	
func process(delta):
	pass
	
func add_item_to_inventory(item_type: String , item: Dictionary): 
	inventory[item_type][item.name] = item
			
func get_inventory():
	return inventory 

func set_active_item(item: Item):
	active_item = item 

func get_active_item():
	if active_item:
		return active_item

func get_equipped_item():
	for weapon in inventory.weapons:
		if inventory.weapons[weapon]["equipped"] == true:
			return inventory.weapons[weapon].scene_path
	return {}

func get_equipped_item_texture():
	for weapon in inventory.weapons:
		if inventory.weapons[weapon]["equipped"] == true:
			return inventory.weapons[weapon].equipped_texture.load_path
	return {}

