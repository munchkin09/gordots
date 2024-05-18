class_name CharacterStateIdle extends PlayerState

@onready var player_node = self.owner as Character

func enter():
	LogDuck.d('Greeting from idle!')
	LogDuck.d(player_node.name)
	LogDuck.d(player_node.animated_sprite)
	

func exit():
	pass

func process(delta):
	if (Input.is_anything_pressed()):
		self.Transitioned.emit(self,'characterstatemove')

func physics_process(delta):
	LogDuck.d('')

