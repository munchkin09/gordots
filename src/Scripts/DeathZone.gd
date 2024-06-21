class_name DeathZone extends Area2D

signal character_on_death_zone

func _on_body_entered(body):
	if body is Gordot:
			GameStateMachine.current_state.Transitioned.emit(GameStateMachine.current_state,"GameOverState")

