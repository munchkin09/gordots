extends Label


var health = 100

func _on_area_2d_body_entered(body):
	health -= 10
	text = "Vida :"  + str(health) 
