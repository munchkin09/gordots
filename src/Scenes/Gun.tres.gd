class_name Gun extends CharacterBody2D

signal impact

# Esto nos permite componer escenas más complejas, ya que podemos inyectar
# los elementos que necesitemos usar dentro de esta escena, y reusar todo
# lo posible y se convierte en opciones parametrizables desde la interfaz gráfica!
@export var player: PackedScene
@export var bullet: PackedScene
@export var bullet_count: int = 1

# Esto se convierte en opciones parametrizables desde la interfaz gráfica!
@export_range(0, 360) var arc: float = 0
@export_range(0, 20) var fire_rate: float = 2.0

@onready var animation = $AnimatedSprite2D
const logHeader = '🏹'
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation.play("idle")


# Esta lógica es para disparar una bala desde un enemigo
# El usar un timer es un simple parche hasta que encontremos una forma mejor
func _on_timer_timeout():
	LogDuck.d(logHeader, ' Shooting!')
	animation.play("shoot")
	var new_bullet = bullet.instantiate()
	new_bullet.position = global_position
	new_bullet.global_rotation = rotation_degrees
	get_tree().root.call_deferred("add_child", new_bullet)
	new_bullet.connect('impact', _on_player_hit)
	await get_tree().create_timer(1/fire_rate).timeout

# Este evento es el listener de una bullet que impacta contra el Player
func _on_player_hit():
	impact.emit()
