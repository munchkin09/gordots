extends Label


var coins = 0

func _on_character_coin_collected():
	coins += 1
	text = "Monedas :"  + str(coins)

