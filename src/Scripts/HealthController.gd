class_name HealthController extends Node

var max_health = 10
var actual_health = 10
var health_remove_factor = 1
const logHeader = '😷 -'
# Called when the node enters the scene tree for the first time.
func _ready():
	LogDuck.d(logHeader, ' Initiated')
	

func _on_player_restore_health(quantity):
	LogDuck.d(logHeader, ' Hit Recieved!!')
	actual_health += quantity

func _on_player_hit(dmg):
	actual_health -= dmg * health_remove_factor
	LogDuck.w(logHeader, ' Hit Recieved!!', ' health remaining: ', actual_health)

	
