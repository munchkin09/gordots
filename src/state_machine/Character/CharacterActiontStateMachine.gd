class_name CharacterActionStateMachine extends Node

@export var initial_state: PlayerActionState
var history: Array[String] = []
var states: Dictionary = {}
var current_state: PlayerActionState

@export var DEBUG: bool = true
@export var ACTIVATE_HISTORY: bool = false
@export var PRINT_HISTORY: bool = false
const logDuckHeader = '🖥️🧓'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	for child in get_children():
		if child is PlayerActionState:
			states[child.name.to_lower()] = child
			child.ActionTransitioned.connect(on_child_transition)
				
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	current_state.process(delta)

func _physics_process(delta):
	current_state.physics_process(delta)

func on_child_transition(state: PlayerActionState, newState: String):
	if state.name == newState:
		return

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
		Log.call('The state history so far: \n', history)

func transition_to(target_state_name: String) :
	current_state.ActionTransitioned.emit(current_state,target_state_name)
	
func process_input(event: InputEvent) -> void:
	if current_state.has_method("process_input"):
		var new_state = current_state.process_input(event)
		if new_state:
			transition_to(new_state)
	
