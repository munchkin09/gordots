class_name CactusStateMove extends CactusState
@export var player_node : Character
func enter():
	LogDuck.d('Greeting from move!!')
	cactus_node.animation.play("move")

func physics_process(delta):
	self._gravity(delta)
	if not Input.is_anything_pressed():
		self.Transitioned.emit(self, 'cactusstateidle')
		return

	self._direction(delta)

	cactus_node.move_and_slide()
