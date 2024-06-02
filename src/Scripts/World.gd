class_name Level1_1 extends Node2D

var level_2_path = 'res://src/Scenes/Level1/Level1_2/Level1_2.tscn'
@onready var tile_map = $TileMap
@onready var death_zone = $DeathZone

# Called when the node enters the scene tree for the first time.
func _ready():
	var transform = tile_map.get_transform()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(900, 100)
	death_zone.get_node('CollisionShape2D').set_shape(shape)
	#LogDuck.d(death_zone.get_node('CollisionShape2D').shape.size)
	#LogDuck.d(death_zone.get_node('CollisionShape2D'))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_bottle_body_entered(body):
	LogDuck.w(body)
	if body is Gordot:
		GameStateMachine.changeSceneTo(level_2_path)

func _on_death_zone_character_on_death_zone():
	LogDuck.d("YOU DIE 💀💀💀")
