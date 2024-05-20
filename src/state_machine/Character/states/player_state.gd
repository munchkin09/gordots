class_name PlayerState extends Node

signal Transitioned
@onready var player_node = self.owner as Character


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500

func enter():
	pass

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	player_node.velocity.y += gravity * delta
	
func _direction(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		player_node.animated_sprite.flip_h = false if (direction == 1) else true
		player_node.velocity.x = direction * SPEED
	else:
		player_node.velocity.x = move_toward(player_node.velocity.x, 0, SPEED)
