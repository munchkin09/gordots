class_name CactusStateAttack extends CactusState

@onready var timer : Timer = $Timer
@export_range(0, 20) var fire_rate: float = 100.0
var distance_to_player: float

func enter():
	LogDuck.w("cactus entra en move")
	cactus_node.animation.play('shoot')
	timer.start()

func exit():
	cactus_node.animation.stop()
	timer.stop()

func process(delta):
	distance_to_player = cactus_node.global_position.distance_to(player_node.global_position)
	if distance_to_player in range(-75,75): 
		changeStateTo('cactusstatemove')
		return
	flip_monito()

func physics_process(delta):
	super(delta)

func _on_timer_timeout():
	shoot_new_bullet()

func onbullettimeout(new_bullet: Bullet):
	new_bullet.free()

func shoot_new_bullet():
	var new_bullet = bullet_node.instantiate() as Bullet

	cactus_node.animation.play("shoot")
	new_bullet.scale.x = 0.3
	new_bullet.scale.y = 0.4

	new_bullet.position = cactus_node.global_position
	var directionBullet = cactus_node.global_position.direction_to(player_node.global_position)
	new_bullet.bullet_direction = 1 if (directionBullet.x > 0) else -1 
	new_bullet.global_rotation = cactus_node.rotation_degrees
	get_tree().root.call_deferred("add_child", new_bullet)

	get_tree().create_timer(5.0).connect("timeout",func(): if new_bullet:new_bullet.destroy())

