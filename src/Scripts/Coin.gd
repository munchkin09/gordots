class_name Coin extends Area2D

signal coin_collected

@onready var soundController = $AudioStreamPlayer2D
const logHeader = '🪙 -'

func _on_body_entered(body):
	LogDuck.d(logHeader)
	coin_collected.emit()
	queue_free()

func _on_character_coin_collected():
	pass # Replace with function body.
