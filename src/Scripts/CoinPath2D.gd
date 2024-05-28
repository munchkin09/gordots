extends Path2D

@export var coin : Coin


func _ready():
	call_deferred("add_child",coin)

