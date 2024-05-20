class_name CactusState extends Node

signal Transitioned
@onready var cactus_node = self.owner as Cactus

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
	pass

func _gravity(delta):
	cactus_node.velocity.y += gravity * delta
	
func _direction(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		#cactus_node.animated_sprite.flip_h = false if (direction == 1) else true
		cactus_node.velocity.x = direction * SPEED
	else:
		cactus_node.velocity.x = move_toward(cactus_node.velocity.x, 0, SPEED)
