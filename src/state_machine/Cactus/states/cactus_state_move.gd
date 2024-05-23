class_name CactusStateMove extends CactusState

var move_direction : Vector2
var wander_time :float
var speed :int = 100
var speedNegative :int = -100
var distance_to_player = 0.0

func enter():
	#LogDuck.d('Greeting from move!')
	distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	var direction = cactus_node.global_position.direction_to(player_node.global_position).x

	cactus_node.velocity = Vector2(speed if (direction > 0) else speedNegative,0.0)
	cactus_node.animation.play("move")

func exit():
	cactus_node.animation.stop()

var oneSec = 0.0
func process(delta):
	flip_monito()
	cactus_node.move_and_slide()
	if distance_to_player < 95:
		changeStateTo('cactusstateattack')

	if distance_to_player > -95:
		changeStateTo('cactusstateattack')

func physics_process(delta):
	distance_to_player = cactus_node.global_position.distance_to(player_node.global_position)
	
	# cactus_node.velocity.x = distance_to_player * delta * 25
	
