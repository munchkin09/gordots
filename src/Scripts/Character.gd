class_name Character extends CharacterBody2D

signal start
signal coin_collected

var faceLeft = true
var coins_collected = 0
const logHeader = '👨‍🦳👩‍🦳'

@export var health_controller: PackedScene

@onready var animated_sprite = $AnimatedSprite2D
@onready var coin_collected_sound = $CoinCollected

var hc: HealthController

func _ready():
	hc = health_controller.instantiate()
	start.emit()

func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == 'Bullet':
		hc._on_player_hit(10)

func _on_coin_coin_collected():
	LogDuck.w('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit()
