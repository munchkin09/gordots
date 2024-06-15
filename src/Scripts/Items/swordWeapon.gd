class_name SwordWeapon extends Area2D

func _process(delta):
	global_position = get_parent().global_position

func _on_area_2d_body_entered(body):
	LogDuck.w(body)

func _on_body_entered(body):
	LogDuck.w(body)
