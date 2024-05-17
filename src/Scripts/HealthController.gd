class_name HealthController extends Node

var max_health = 10
var actual_health = 10
var health_remove_factor = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	LogDuck.d('😷 Health Controller Initiated')

func _on_player_hit():
	LogDuck.d('😷 Health Controller Hit Recieved!!')
	
	actual_health -= health_remove_factor
