class_name CactusState extends Node

signal Transitioned
var player_node: Character
var bullet_node: PackedScene
var cactus_node: Cactus
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 20
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

var facing_rigth = true

func flip_monito():
	facing_rigth = !facing_rigth
	#cactus_node.animation.set_flip_h(facing_rigth)
	cactus_node.scale.x = abs(cactus_node.scale.x) * -1
	if facing_rigth:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func changeStateTo(state: String):
	const message = 'Changing state to [%s] [%s]'
	var _formated_message = message % [state, cactus_node.name]
	Log.call(_formated_message)
	self.Transitioned.emit(self, state)
