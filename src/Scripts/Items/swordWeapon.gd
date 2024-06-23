class_name SwordWeapon extends Item

@onready var sound_hit :AudioStreamPlayer2D = $SwordHitAudioStreamPlayer2D
@onready var get_sword_sound :AudioStreamPlayer2D = $GetSwordAudioStreamPlayer2D

var equipped = false
#this is one of the posible shortcuts to have a class constructor
func pass_owner(owner: Node2D):
	weapon_owner = owner


func _process(delta):
	if equipped == true: 
		global_position = get_parent().global_position
		sprite.flip_h  = weapon_owner.animated_sprite.is_flipped_h()

func _on_body_entered(body):
	if body.is_in_group("Enemies"):
		body.receive_hit(damage)

	if equipped == false and body is Gordot:
		var pepe = get_tree().get_nodes_in_group('inventory')
		collision.disabled = true
		#item_collision.disabled = true
		remove_child(item_collision)
		get_parent().remove_child(self)
		pass_owner(body)
		body.set_active_item(self)
		play_get_sword_sound()
		equipped = true
		for rect in pepe:
			if rect.texture == null:
				rect.texture = sprite.texture
				break

func activate():
	collision.disabled = false
	sound_hit.play()
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		collision.disabled = true

func play_get_sword_sound():
	get_sword_sound.play()

#func _on_sword_body_entered(body: Character):
#	var weapon = 
#	animated_sprite.get_node("Hand").add_child(weapon)
#	weapon_on_hand = weapon
#	weapon.play_get_sword_sound()
#	player_action_state_machine.current_state.animation_player = weapon
#	player_action_state_machine.transition_to("playeractionstateidle")
