extends Area2D

const logHeader = '🪙 -'

func _on_body_entered(body):
	LogDuck.d(logHeader)
