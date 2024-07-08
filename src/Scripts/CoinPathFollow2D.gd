extends PathFollow2D

var speed = 0.5

@onready var coin : Coin 

func _process(delta):
	progress_ratio += delta * speed
	
func _physics_process(delta):
	set_h_offset(get_h_offset() + delta )

func _on_child_entered_tree(node):
	pass
