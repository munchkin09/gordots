class_name Sword extends Area2D

func _on_body_entered(body):
	if body is Gordot:
		queue_free()
	

