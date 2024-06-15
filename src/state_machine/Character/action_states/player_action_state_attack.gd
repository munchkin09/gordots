class_name PlayerActionStateAttack extends PlayerActionState

func enter():
	LogDuck.w(" action attack")
	super()
	
	if player_node.weapon_on_hand:		
		_play("attack",on_attack_animation_finished)
		player_node.weapon_on_hand.activate()
		

func exit():
	pass

func process(_delta):
	pass 
	
func physics_process(_delta):
	super(_delta)

func process_input(event: InputEvent):
	pass

func on_attack_animation_finished(animation_name):
	LogDuck.w("se ha acabao la animacion de ataque")
	self.ActionTransitioned.emit(self, 'playeractionstateidle')
