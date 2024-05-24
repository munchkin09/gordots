class_name Coin extends Area2D

signal coin_collected

const logDuckHeader = '🪙 '

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _on_body_entered(_body):
	Log.call(' collected!')
	coin_collected.emit()
	queue_free()

func _on_character_coin_collected():
	pass # Replace with function body.
