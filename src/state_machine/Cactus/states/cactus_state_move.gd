class_name CactusStateMove extends CactusState

var move_direction : Vector2
var wander_time :float
var speed :int = 500

func enter():
	LogDuck.d('Greeting from move!')
	cactus_node.animation.play("move")
	flip_monito()

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	flip_monito()
	var distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	var direction_to_player = player_node.global_position - cactus_node.global_position
	cactus_node.velocity.x = distance_to_player * delta * 25

	if direction_to_player.length() < 100 and direction_to_player.length() > -100:
		self.Transitioned.emit(self, 'cactusstateattack')
		return
	cactus_node.move_and_slide()
