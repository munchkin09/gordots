class_name Character extends CharacterBody2D

signal start
signal coin_collected

var faceLeft = true
const logHeader = '👨‍🦳👩‍🦳'

@export var health_controller: PackedScene
@onready var characterStateMachine: GamerStateMachine = $GamerStateMachine

@onready var animated_sprite = $AnimatedSprite2D
@onready var coin_collected_sound = $CoinCollected
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hc: HealthController

func _ready():
	hc = health_controller.instantiate()
	start.emit()

func _physics_process(delta):
	animated_sprite.pause()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


func _on_area_2d_body_entered(body):
	hc._on_player_hit(10)

func _on_coin_coin_collected():
	LogDuck.w('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit()
