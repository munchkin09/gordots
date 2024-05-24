extends Node2D

var path = 'res://src/Scenes/Level1/Level1_1.tscn'

func _on_button_pressed():
	GameStateMachine.changeSceneTo(path)
