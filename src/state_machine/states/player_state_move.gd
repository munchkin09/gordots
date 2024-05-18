class_name CharacterStateMove extends PlayerState

func enter():
	LogDuck.d('Greeting from move!!')

func process(delta):
	if (Input.is_action_pressed("ui_cut")):
		state_machine.change_to('CharacterStateIdle')
	
