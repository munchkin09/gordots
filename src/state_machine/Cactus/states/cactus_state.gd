class_name CactusState extends Node

signal Transitioned
var player_node: Character
var bullet_node: PackedScene
var cactus_node: Cactus
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500
const logDuckHeader = '🖥️🌵'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + ' ' + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func enter():
	pass

func exit():
	pass

func process(_delta):
	pass

func physics_process(delta):
	cactus_node.velocity.y += gravity * delta

func _set(property, value):
	self[property] = value
	return

var flipped = true

func flip_monito():
	var direction = player_node.global_position.x - cactus_node.global_position.x
	if (direction) > 0:
		flipped = false
	else:
		flipped = true
	cactus_node.animation.set_flip_h(flipped)

func changeStateTo(state: String):
	const message = 'Changing state to [%s] [%s]'
	var _formated_message = message % [state, cactus_node.name]
	#LogDuck.e(formated_message)
	self.Transitioned.emit(self, state)
