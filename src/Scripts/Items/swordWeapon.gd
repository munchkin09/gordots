class_name SwordWeapon extends Area2D

@onready var collision :CollisionPolygon2D = $CollisionPolygon2D
@onready var animation :AnimationPlayer = $AnimationPlayer
func _process(delta):
	global_position = get_parent().global_position

func _on_area_2d_body_entered(body):
	LogDuck.w(body)

func _on_body_entered(body):
	LogDuck.w(body)

func activate():
	collision.disabled = false

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":		
		collision.disabled = true
