class_name CactusStateMove extends CactusState


var move_direction : Vector2
var wander_time :float
var speed :int = 500
func enter():
	LogDuck.d('Greeting from idle!')
	randomize_wander()
	
func exit():
	pass

func process(delta):
	pass

func physics_process(delta,player_node,cactus_node):
	var distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	cactus_node.velocity.x = distance_to_player * delta * 50
	cactus_node.move_and_slide()
	cactus_node.animation.play("move")
	if distance_to_player < 10:
		self.Transitioned.emit(self, 'cactus_state_attack')


func randomize_wander():
	move_direction = Vector2(randf_range(-100,100), randf_range(-100,100)).normalized()
	wander_time = randf_range(1,3)
	

	
