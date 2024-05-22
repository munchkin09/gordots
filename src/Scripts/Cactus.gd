class_name Cactus extends CharacterBody2D

# Esto nos permite componer escenas más complejas, ya que podemos inyectar
# los elementos que necesitemos usar dentro de esta escena, y reusar todo
# lo posible y se convierte en opciones parametrizables desde la interfaz gráfica!

@export var character: Character
@export var bullet_count: int = 1
@export var debug_lines: bool = false



@onready var animation = $AnimatedSprite2D
@export var bullet: PackedScene 
const logHeader = '🏹'
var debug :Dictionary = 	{
	"velocity": velocity,
	"point": 		Vector2(1.0,1.0)
}
signal start

func _ready():

	for child in get_children(true):
		if child.name == 'CactusStateMachine':
			child._set('player_node', character)
			child._set('bullet_node', bullet)
			child._set('cactus_node', self)
	start.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _physics_process(delta):
	if debug_lines:
		queue_redraw()

func _draw():
	if debug_lines:
		var distance_to_player = character.global_position - self.global_position
		draw_line(Vector2(0,0),distance_to_player, Color.BLACK,1.0)

# Esta lógica es para disparar una bala desde un enemigo
# El usar un timer es un simple parche hasta que encontremos una forma mejor
#func _on_timer_timeout():
	#LogDuck.d(logHeader, ' Shooting!')
#
	#var new_bullet = bullet.instantiate()
#
	#animation.play("shoot")
	#new_bullet.position = global_position
	#new_bullet.global_rotation = rotation_degrees
	#get_tree().root.call_deferred("add_child", new_bullet)
#
	#

