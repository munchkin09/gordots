class_name SwordWeapon extends Area2D

@onready var collision :CollisionPolygon2D = $CollisionPolygon2D
@onready var animation :AnimationPlayer = $AnimationPlaye
@onready var damage = 50

func _process(delta):
	global_position = get_parent().global_position

func _on_body_entered(body):
	if body.is_in_group("Enemies"):
		body.receive_hit(damage)

func activate():
	collision.disabled = false

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":		
		collision.disabled = true
