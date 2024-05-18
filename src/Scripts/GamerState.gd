class_name GamerStateMachine extends Node

@onready var player_node = self.owner as Character

@export_node_path('Node') var initial_state
@onready var state = get_node(initial_state)
@onready var characterAS2D = $AnimatedSprite2D

@export var DEBUG: bool = true
@export var ACTIVATE_HISTORY: bool = false
@export var PRINT_HISTORY: bool = false

const SPEED = 120
const JUMP_VELOCITY = -500
var history: Array[String] = []
var states: Dictionary = {}

var current_state: PlayerState

func _ready():
	for child in get_children():
		if child is PlayerState:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	if (state.has_method('process')):
		state.process(delta)
	pass

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and player_node.is_on_floor():
		player_node.velocity.y = JUMP_VELOCITY
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		characterAS2D.flip_h = false if (direction == 1) else true
		characterAS2D.play("run")
		state
		player_node.velocity.x = direction * SPEED
	else:
		characterAS2D.play("idle")
		player_node.velocity.x = move_toward(player_node.velocity.x, 0, SPEED)
	player_node.move_and_slide()

	if (state.has_method('physics_process')):
		state.physics_process(delta)

func on_child_transition(state: PlayerState, newState: String):
	if state.name == newState:
		return
	var new_state = states.get(newState.to_lower())

	if !new_state:
		return

	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state

func states_history():
	if (ACTIVATE_HISTORY):
		history.append(state.name)

	if (PRINT_HISTORY):
		LogDuck.d('The state history so far: \n', history)
