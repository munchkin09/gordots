class_name UI extends Node

var equipped_weapon : Item

func _on_character_health_changed(actual_health):
	%LifeLabel.text = str(actual_health)

func _on_character_coin_collected(total_coins):
	%CoinsLabel.text =  str(total_coins)

func _on_hand_child_entered_tree(node):
	%WeaponTextureRect.texture = load(GameStateMachine.items_controller.get_equipped_item_texture())

func _process(delta):
	pass
