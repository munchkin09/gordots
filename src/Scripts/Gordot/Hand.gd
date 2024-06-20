class_name  Hand extends Node2D

var facing_rigth : Vector2 = Vector2(2,8)
var facing_left : Vector2 = Vector2(-7,6)
var last_direction: Vector2

func _ready():
	last_direction = facing_rigth

func turn_rigth():
	last_direction = facing_rigth
	
func turn_left():
	last_direction = facing_left

func _process(delta):
	var flipped = owner.animated_sprite.is_flipped_h()
	if flipped:
		turn_left()
	else:
		turn_rigth()
	LogDuck.w(self.owner)

	self.position = last_direction
	
