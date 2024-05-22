class_name CactusStateMove extends CactusState

var move_direction : Vector2
var wander_time :float
var speed :int = 500

func enter():
	LogDuck.d('Greeting from move!')
	flip_monito()

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	var distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	var direction_to_player = player_node.global_position - cactus_node.global_position
	cactus_node.velocity.x = distance_to_player * delta * 50
	cactus_node.animation.play("move")
	cactus_node.move_and_slide()
	flip_monito()
	if direction_to_player.length() < 100:
		self.Transitioned.emit(self, 'cactusstateattack')
		return

func flip_monito():
	if (player_node.global_position.x + cactus_node.global_position.x) < 0:
		cactus_node.animation.set_flip_h(true)
	else:
		cactus_node.animation.set_flip_h(false)
