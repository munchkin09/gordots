extends Label


var coins = 0

func _on_character_coin_collected():
	coins += get_children().count()
