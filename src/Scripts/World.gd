class_name Level1_1 extends Node2D

var level_2_path = 'res://src/Scenes/Level1/Level1_2/Level1_2.tscn'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_bottle_body_entered(body):
	LogDuck.w(body)
	if body is Gordot:
		GameStateMachine.changeSceneTo(level_2_path)
