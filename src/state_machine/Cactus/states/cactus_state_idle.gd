class_name CactusStateIdle extends CactusState


var move_direction : Vector2
var wander_time :float

func enter():
	LogDuck.d('Greeting from idle!')
	randomize_wander()
	
func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	#var direction = cactus_node.global_position - player_node.global_position
	#LogDuck.w("la direccion es :" + direction)
	if wander_time > 0:
		wander_time -=  delta
	else:
		randomize_wander()
	cactus_node.velocity.x = move_direction.x * delta * 500
	cactus_node.move_and_slide()
	cactus_node.animation.play("idle")
	


func randomize_wander():
	move_direction = Vector2(randf_range(-100,100), randf_range(-100,100)).normalized()
	wander_time = randf_range(1,3)
	

	
