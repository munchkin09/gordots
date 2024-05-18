class_name CharacterStateMove extends PlayerState

@onready var player_node = self.owner as Character

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 120
const JUMP_VELOCITY = -500

func enter():
	LogDuck.d('Greeting from move!!')
	

func process(delta):
	if (!Input.is_anything_pressed()):
		self.Transitioned.emit(self, 'characterstateidle')
		return
	
	var direction = Input.get_axis("ui_left", "ui_right")	

	# Add the gravity.
	if not player_node.is_on_floor():
		player_node.velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and player_node.is_on_floor():
		player_node.velocity.y = JUMP_VELOCITY

	LogDuck.d(player_node)
	if direction:
		player_node.animated_sprite.flip_h = false if (direction == 1) else true
		player_node.animated_sprite.play("run")
		
		player_node.velocity.x = direction * SPEED
	else:
		player_node.animated_sprite.play("idle")
		player_node.velocity.x = move_toward(player_node.velocity.x, 0, SPEED)

	player_node.move_and_slide()
