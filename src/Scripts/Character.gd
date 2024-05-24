class_name Character extends CharacterBody2D

signal start
signal coin_collected

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const logDuckHeader = '👨‍🦳👩‍🦳'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

