class_name PlayerActionState extends Node

signal ActionTransitioned

@onready var item_on_hand :Area2D = null
@onready var player_node = self.owner as Character
var animation_player :AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500


const logDuckHeader = '🖥️🧓'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)
 

func enter():
	if player_node.weapon_on_hand :
		animation_player = player_node.weapon_on_hand.get_node('AnimationPlayer') as AnimationPlayer

func exit():
	pass

func process(_delta):
	Log.call(owner)

func physics_process(delta):
	pass

func _direction(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player_node.weapon_on_hand.get_node('Sprite2D').flip_h = false if (direction == 1) else true
		
func _play(animation,connect_to = null):
	animation_player.play(animation)
	if connect_to:
		animation_player.animation_finished.connect(connect_to)


