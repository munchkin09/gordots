class_name CactusStateMove extends CactusState

var move_direction : Vector2
var wander_time :float
var speed :int = 50
var distance_to_player = 0.0

func enter():
	LogDuck.w("cactus entra en move")
	calculate_direction(1)
	cactus_node.move_and_slide()

func exit():
	cactus_node.animation.stop()

func process(_delta):
	if cactus_node.is_on_floor():
		flip_monito()
	if distance_to_player in range(-75,75):
		changeStateTo('cactusstateattack')

func physics_process(delta):
	flip_monito()
	super(delta)
	calculate_direction(delta)
	if  flipped:
		cactus_node.velocity.x = cactus_node.velocity.x * -1
	cactus_node.move_and_slide()
	
func calculate_direction(delta):
	distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	var direction = cactus_node.global_position.direction_to(player_node.global_position)
	cactus_node.velocity.x += direction.x * speed * delta
	cactus_node.animation.play("move")

