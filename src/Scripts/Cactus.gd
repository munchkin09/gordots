class_name Cactus extends Enemy

@onready var animation = $AnimatedSprite2D
# Esto nos permite componer escenas más complejas, ya que podemos inyectar
# los elementos que necesitemos usar dentro de esta escena, y reusar todo
# lo posible y se convierte en opciones parametrizables desde la interfaz gráfica!
@export var bullet: PackedScene 

func _ready():
	for child in get_children(true):
		if child.name == 'CactusStateMachine':
			child._set('player_node', character)
			child._set('bullet_node', bullet)
			child._set('cactus_node', self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
