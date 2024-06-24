class_name CactusStateMove extends CactusState

var move_direction : Vector2
var wander_time :float
var distance_to_player = 0.0

func enter():
	LogDuck.w("cactus entra en move")
	cactus_node.animation.play('move')
	

func exit():
	cactus_node.animation.stop()

func process(_delta):
	distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	if int(distance_to_player) in range(-75,75):
		changeStateTo('cactusstateattack')

func physics_process(delta):
	super(delta)
	cactus_node.velocity.x = speed
	if !cactus_node.im_colliding && cactus_node.is_on_floor():
		flip_monito()
	cactus_node.move_and_slide()
	
func calculate_direction(delta):
	distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	var direction = cactus_node.global_position.direction_to(player_node.global_position)
	cactus_node.velocity.x += direction.x * speed * delta
	cactus_node.animation.play("move")

