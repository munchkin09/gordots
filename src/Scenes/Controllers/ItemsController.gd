class_name ItemsController extends Node

const INITIAL_COINS = 0
var actual_coins = INITIAL_COINS
var inventory :Node = Node.new()

const logDuckHeader = '😷 '

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	
	Log.call('Initiated')

func add_item_to_inventory(item: Item): 
	inventory.add_child(item)
		
func get_inventory():
	return inventory 
