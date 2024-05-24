class_name HealthController extends Node

var max_health = 10
var actual_health = 10
var health_remove_factor = 1

const logDuckHeader = '😷 '

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

# Called when the node enters the scene tree for the first time.
func _ready():
	Log.call('Initiated')
	

func _on_player_restore_health(quantity):
	Log.call('Hit Recieved!!')
	actual_health += quantity

func _on_player_hit(dmg):
	actual_health -= dmg * health_remove_factor
	Log.call(' Hit Recieved!!', ' health remaining: ', actual_health)
