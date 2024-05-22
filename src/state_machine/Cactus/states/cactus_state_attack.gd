class_name CactusStateAttack extends CactusState

func enter():
	LogDuck.d('Greeting from attack!!')
	cactus_node.animation.play("attack")

func physics_process(delta):
	#self._gravity(delta)
	LogDuck.d(player_node)
	var distance_to_player = player_node.global_position.x - cactus_node.global_position.x
	if distance_to_player >= 10:
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
