class_name HealthController extends Node

const INITIAL_HEALTH = 200
var max_health = 100
var actual_health = INITIAL_HEALTH
var health_remove_factor = 1
@onready var player_node = self.get_parent() as Character

const logDuckHeader = '😷 '

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	Log.call('Initiated')

func _on_player_restore_health(quantity):
	Log.call('Hit Recieved!!')
	actual_health += quantity

func _on_player_hit(dmg):
	actual_health -= dmg * health_remove_factor
	Log.call(' Hit Recieved!!', ' health remaining: ', actual_health)

func get_actual_health():
	return actual_health

func reset():
	actual_health = INITIAL_HEALTH
