class_name UI extends Node

#func _enter_tree():
#	var health_controller : HealthController = get_tree().current_scene.get_node("HealthController")
#	%LifeLabel.text = health_controller.get_actual_health()

func _on_character_health_changed(actual_health):
	%LifeLabel.text = str(actual_health)

func _on_character_coin_collected(total_coins):
	%CoinsLabel.text =  str(total_coins)
