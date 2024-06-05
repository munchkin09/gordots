class_name UI extends Node

func _on_character_health_changed(actual_health):
	%LifeLabel.text = str(actual_health)

func _on_character_coin_collected(total_coins):
	%CoinsLabel.text =  str(total_coins)
