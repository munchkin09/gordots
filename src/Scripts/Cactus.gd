class_name Cactus extends Enemy

@onready var animation = $AnimatedSprite2D
@export var bullet: PackedScene 
@onready var life = 100

func _ready():
	for child in get_children(true):
		if child.name == 'CactusStateMachine':
			child._set('player_node', character)
			child._set('bullet_node', bullet)
			child._set('cactus_node', self)

func _process(_delta):
	pass

func receive_hit(damage):
	life -= damage
	LogDuck.w(life)
	if life <= 0:
		queue_free()
