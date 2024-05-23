class_name Character extends CharacterBody2D

signal start
signal coin_collected

var faceLeft = true
var coins_collected = 0

@export var health_controller: PackedScene

@onready var coin_collected_sound = $CoinCollected
@onready var animated_sprite = $AnimatedSprite2D

var hc: HealthController
const logDuckHeader = '👨‍🦳👩‍🦳'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	hc = health_controller.instantiate()
	start.emit()

func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body is Bullet:
		hc._on_player_hit(10)
		body.destroy()
		

func _on_coin_coin_collected():
	Log.call('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit()
