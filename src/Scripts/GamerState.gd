class_name GamerStateMachine extends Node

@export var initial_state: PlayerState
var history: Array[String] = []
var states: Dictionary = {}
var current_state: PlayerState

@export var DEBUG: bool = true
@export var ACTIVATE_HISTORY: bool = false
@export var PRINT_HISTORY: bool = false
@onready var player_node = self.owner as Character

func _ready():
	for child in get_children():
		if child is PlayerState:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	current_state.process(delta)

func _physics_process(delta):
	current_state.physics_process(delta)

func on_child_transition(state: PlayerState, newState: String):
	if state.name == newState:
		return
	LogDuck.d('Changin to: ', newState.to_lower())
	var new_state = states.get(newState.to_lower())

	if !new_state:
		return

	if current_state:
		current_state.exit()
		history.append(current_state.to_string())

	new_state.enter()
	current_state = new_state

func states_history():
	if (ACTIVATE_HISTORY):
		history.append(current_state.name)

	if (PRINT_HISTORY):
		LogDuck.d('The state history so far: \n', history)
