class_name Coin extends Area2D

signal coin_collected

@onready var soundController = $AudioStreamPlayer2D
const logHeader = '🪙 -'

func _on_body_entered(body):
	LogDuck.d(logHeader)
	await coin_collected.emit()
	queue_free()
	
	
	
