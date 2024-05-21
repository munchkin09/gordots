class_name CactusStateAttack extends CactusState



func enter():
	LogDuck.d('Greeting from attack!!')
	cactus_node.animation.play("move")

func physics_process(delta,player_node,cactus_node):
	#self._gravity(delta)
	var distance_to_player = cactus_node.get_last_motion () - player_node.get_last_motion()
	if distance_to_player.length() >= 10:
		self.Transitioned.emit(self, 'cactusstatemove')
		return
#
	#var new_bullet = bullet_node.instantiate()
##
	#animation.play("shoot")
	#new_bullet.position = global_position
	#new_bullet.global_rotation = rotation_degrees
	#get_tree().root.call_deferred("add_child", new_bullet)
##
	#await get_tree().create_timer(1/fire_rate).timeout
	#self._direction(delta)
#
	#cactus_node.move_and_slide()
