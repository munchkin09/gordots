class_name BaseStateClass extends Node

signal Transitioned

const logDuckHeader = '🖥️🎮'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + ' ' + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func enter():
	pass

func exit():
	pass

func process(delta):
	pass

func physics_process(delta):
	pass
