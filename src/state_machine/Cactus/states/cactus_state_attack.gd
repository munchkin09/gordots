class_name CactusStateAttack extends CactusState

@onready var timer : Timer = $Timer
@export_range(0, 20) var fire_rate: float = 100.0

func enter():
	LogDuck.d('Greeting from attack!!')
	cactus_node.animation.play("attack")
	shoot_new_bullet()
	timer.start()
	

func exit():
	timer.stop()	
	
	
func physics_process(delta):
	flip_monito()
	var direction_to_player = player_node.global_position - cactus_node.global_position
	if direction_to_player.length() >= 100 and direction_to_player.length() <= -100:
		self.Transitioned.emit(self, 'cactusstatemove')
		return


func _on_timer_timeout():
	shoot_new_bullet()
	
func onbullettimeout(new_bullet):
	new_bullet.free()

func shoot_new_bullet():
	var new_bullet = bullet_node.instantiate() as Bullet
	
	cactus_node.animation.play("shoot")
	new_bullet.scale.x = 0.5
	new_bullet.scale.y = 0.6

	new_bullet.position = cactus_node.global_position
	new_bullet.bullet_direction = player_node.global_position
	new_bullet.global_rotation = cactus_node.rotation_degrees
	get_tree().root.call_deferred("add_child", new_bullet)
	
	get_tree().create_timer(5.0).connect("timeout",func(): if new_bullet:new_bullet.destroy())

