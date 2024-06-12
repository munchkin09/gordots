class_name Level1_1 extends Node2D

var level_2_path = 'res://src/Scenes/Level1/Level1_2/Level1_2.tscn'
@onready var tile_map = $TileMap
@onready var death_zone = $DeathZone
@onready var gordot     = $Gordot
@onready var game_over_message = $GameOverCanvasLayer
var finishing_level = false
var actual_zoom  :Vector2

func _ready():
	var transform = tile_map.get_transform()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(900, 100)
	death_zone.get_node('CollisionShape2D').set_shape(shape)

func _process(delta):
	if (finishing_level && gordot.get_node("Camera2D").zoom <= Vector2(50,50)) :
		set_process_input(false)
		var actualZoom = gordot.get_node("Camera2D").zoom 
		gordot.get_node("Camera2D").zoom = Vector2(actualZoom.x + 0.4 , actualZoom.y + 0.4 	) 
		gordot.get_node("IntroMusic").pitch_scale += gordot.get_node("IntroMusic").pitch_scale * delta 
		
	elif (finishing_level && gordot.get_node("Camera2D").zoom > Vector2(50,50)):
		GameStateMachine.changeSceneTo(level_2_path)
	else:
		finishing_level = false
	
func _on_bottle_body_entered(body):
	if body is Gordot:
		finishing_level = true 
		


func _on_death_zone_character_on_death_zone():
	LogDuck.d("YOU DIE 💀💀💀")

func _on_gordot_im_death():
	game_over_message.visible = true

