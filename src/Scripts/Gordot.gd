class_name Gordot extends Character

var faceLeft = true
var coins_collected = 0
var weapon_on_hand : SwordWeapon

@onready var player_movement_state_machine = $PlayerMovementStateMachine
@onready var player_action_state_machine = $PlayerActionStateMachine
@onready var coin_collected_sound = $CoinCollected
@onready var animated_sprite = $AnimatedSprite2D
@onready var hit_sound = $HitSound
@onready var death_sound = $GameOverSounds
@onready var health_controller = GameStateMachine.health_controller
@onready var item_controller = GameStateMachine.items_controller
@onready var inventory :Array[Item]
signal health_changed(actual_health)
signal im_death

func _ready():
	health_changed.emit(health_controller.get_actual_health())
	inventory = item_controller.get_inventory()
	start.emit()

func _unhandled_input(event: InputEvent) -> void:
	player_movement_state_machine.process_input(event)
	player_action_state_machine.process_input(event)
		
func _on_area_2d_body_entered(body):
	if body is Bullet:
		health_controller._on_player_hit(10)
		body.destroy()
		animated_sprite.play("hit")
		hit_sound.play()
		var actual_health = health_controller.get_actual_health()
		health_changed.emit(actual_health)
		if actual_health <= 0:
			im_death.emit()
			death_sound.play()		
						
func _on_coin_coin_collected():
	Log.call('+1 coin')
	coin_collected_sound.play()
	coins_collected+=1
	coin_collected.emit(coins_collected)
	
func set_active_item(item: Item):
	get_node("Hand").add_child(item)
	weapon_on_hand = item
	player_action_state_machine.current_state.animation_player = item
	player_action_state_machine.transition_to("playeractionstateidle")
