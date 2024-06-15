class_name PlayerActionState extends Node

signal ActionTransitioned
@onready var sword_node = self.owner as SwordWeapon


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500
var animation: AnimationPlayer

const logDuckHeader = '🖥️🧓'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)
 

func enter():
	pass
	#if not animation:
	#	animation = sword_node.get_node('AnimationPlayer') as AnimationPlayer

func exit():
	pass

func process(_delta):
	pass

func physics_process(delta):
	pass


func _direction(delta):
	pass
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	animation.flip_h = false if (direction == 1) else true
		

func _play(anim):
	pass
	
	#animation.play(anim)
