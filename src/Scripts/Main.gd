extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0).timeout
	GameStateMachine.startStateMachine(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
