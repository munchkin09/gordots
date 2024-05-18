class_name Character extends CharacterBody2D

signal start
signal coin_collected

var faceLeft = true
var coins_collected = 0
const logHeader = '👨‍🦳👩‍🦳'

@export var health_controller: PackedScene
@export var characterStateMachine: GamerStateMachine

@onready var animated_sprite = $AnimatedSprite2D
@onready var coin_collected_sound = $CoinCollected
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hc: HealthController

func _ready():
	hc = health_controller.instantiate()
	start.emit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		player_node.velocity.y = JUMP_VELOCITY
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		animated_sprite.flip_h = false if (direction == 1) else true
		animated_sprite.play("run")
		
		velocity.x = direction * SPEED
	else:
		animated_sprite.play("idle")
		velocity.x = move_toward(player_node.velocity.x, 0, SPEED)
	move_and_slide()

	if (current_state.has_method('physics_process')):
		current_state.physics_process(delta)

func _on_area_2d_body_entered(body):
	hc._on_player_hit(10)

func _on_coin_coin_collected():
	LogDuck.w('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit()
