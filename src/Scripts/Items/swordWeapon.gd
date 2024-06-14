class_name SwordWeapon extends Area2D

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	global_position = get_parent().global_position



func _on_body_entered(body):
	LogDuck.w(body)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	LogDuck.w(body)
