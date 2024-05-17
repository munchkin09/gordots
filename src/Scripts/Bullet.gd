class_name new_coin extends CharacterBody2D

var speed = Vector2(1,1)
var direction = Vector2.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity = direction * speed 
	var collision = move_and_collide(velocity)
	
	if collision:
		queue_free()
