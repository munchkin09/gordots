class_name PlayerMovementState extends Node

signal Transitioned
@onready var player_node = self.owner as Character
@onready var camera_node : Camera2D = player_node.get_node("Camera2D")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500
var sprite: AnimatedSprite2D
var direction 
const logDuckHeader = '🖥️🧓'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)
 
func enter():
	if not sprite:
		sprite = player_node.get_node('AnimatedSprite2D') as AnimatedSprite2D

func exit():
	pass

func process(_delta):
	pass

func physics_process(delta):
	player_node.velocity.y += gravity * delta

func _direction(delta):
	direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		player_node.animated_sprite.flip_h = false if (direction == 1) else true
		player_node.velocity.x = direction * SPEED
	else:
		player_node.velocity.x = move_toward(player_node.velocity.x, 0, SPEED)

func _play(anim):
	sprite.play(anim)

