class_name Gordot extends Character


var faceLeft = true
var coins_collected = 0

@export var health_controller: PackedScene
@onready var coin_collected_sound = $CoinCollected
@onready var animated_sprite = $AnimatedSprite2D

var hc: HealthController

func _ready():
	hc = health_controller.instantiate()
	start.emit()

func _on_area_2d_body_entered(body):
	if body is Bullet:
		hc._on_player_hit(10)
		body.destroy()
		

func _on_coin_coin_collected():
	Log.call('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit()
