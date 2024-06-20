class_name SwordWeapon extends Area2D

@onready var collision :CollisionPolygon2D = $CollisionPolygon2D
@onready var sprite :Sprite2D = $Sprite2D
@onready var damage = 100
@onready var sound_hit :AudioStreamPlayer2D = $SwordHitAudioStreamPlayer2D
@onready var get_sword_sound :AudioStreamPlayer2D = $GetSwordAudioStreamPlayer2D
@export var weapon_owner : Node2D 

#this is one of the posible shortcuts to have a class constructor
func pass_owner(owner: Node2D) -> SwordWeapon:
	weapon_owner = owner
	return self

func _process(delta):
	global_position = get_parent().global_position
	var flipped = weapon_owner.animated_sprite.is_flipped_h()
	sprite.flip_h  = weapon_owner.animated_sprite.is_flipped_h()

func _on_body_entered(body):
	if body.is_in_group("Enemies"):
		body.receive_hit(damage)

func activate():
	collision.disabled = false
	sound_hit.play()
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":		
		collision.disabled = true

func play_get_sword_sound():
	get_sword_sound.play()
