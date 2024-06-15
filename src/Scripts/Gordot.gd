class_name Gordot extends Character

var faceLeft = true
var coins_collected = 0
var sword_weapon = preload("res://src/Scenes/Objects/sword_weapon.tscn")
var weapon_on_hand : SwordWeapon

@onready var player_movement_state_machine = $PlayerMovementStateMachine
@onready var player_action_state_machine = $PlayerActionStateMachine
@export var health_controller: PackedScene
@onready var coin_collected_sound = $CoinCollected
@onready var animated_sprite = $AnimatedSprite2D
@onready var hit_sound = $HitSound
@onready var death_sound = $GameOverSounds

var hc: HealthController
signal health_changed(actual_health)
signal im_death

func _ready():
	hc = health_controller.instantiate()
	health_changed.emit(hc.get_actual_health())
	start.emit()

func _unhandled_input(event: InputEvent) -> void:
	player_movement_state_machine.process_input(event)
	player_action_state_machine.process_input(event)
		
func _on_area_2d_body_entered(body):
	if body is Bullet:
		hc._on_player_hit(10)
		body.destroy()
		animated_sprite.play("hit")
		hit_sound.play()
		var actual_health = hc.get_actual_health()
		health_changed.emit(actual_health)
		if actual_health <= 0:
			im_death.emit()
			death_sound.play()		
						
func _on_coin_coin_collected():
	Log.call('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit(coins_collected)

func _on_sword_body_entered(body):
	LogDuck.w(body)
	var weapon = sword_weapon.instantiate()
	get_node("Hand").add_child(weapon)
	weapon_on_hand = weapon
	weapon.play_get_sword_sound()
	player_action_state_machine.current_state.animation_player = weapon
	player_action_state_machine.transition_to("playeractionstateidle")
	
func _on_hand_child_entered_tree(node):
	Log.call("soy gordito y bonachon.soy gordot")
