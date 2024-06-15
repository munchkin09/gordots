class_name CharacterStateDeath extends PlayerState

@onready var death_duration : Timer = $Timer

func enter():
	Log.call('Greetings from death!')
	super()
	set_process_unhandled_input(false)
	player_node.move_and_slide()
	_play('death')
	camera_node._shake(1)
	await get_tree().create_timer(2.0).timeout
	GameStateMachine.current_state.Transitioned.emit(GameStateMachine.current_state,"GameOverState")
	
func exit():
	GameStateMachine.restart_scene()

func process(_delta):
	pass

func physics_process(delta):
	pass


