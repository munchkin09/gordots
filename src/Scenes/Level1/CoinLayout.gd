extends Node2D

@export var character_node: Character

# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children(true)
	for child in children:
		child.connect('coin_collected', character_node._on_coin_coin_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
