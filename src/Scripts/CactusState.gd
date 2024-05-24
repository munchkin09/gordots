class_name CactusStateMachine extends Node

@export var initial_state: CactusState
var player_node : Character
var bullet_node: PackedScene

var history: Array[String] = []
var states: Dictionary = {}
var current_state: CactusState

@export var DEBUG: bool = true
@export var ACTIVATE_HISTORY: bool = false
@export var PRINT_HISTORY: bool = false

var children = []
const logDuckHeader = '🖥️🌵'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)
 
func _ready():
	for child in get_children(true):
		if child is CactusState:
			var pepa = 'State [%s] added' 
			var pepe = pepa % child.name.to_lower()
			Log.call(pepe)
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			children.append(child)
			if child.name == "CactusStateMove":
				current_state = child	 
				
				


func _process(delta):
	current_state.process(delta)

func _physics_process(delta):
	current_state.physics_process(delta)

func on_child_transition(state: CactusState, newState: String):
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
		Log.call('📖 The state history so far: \n', history)

func _set(property, value):
	for child in children:
		child._set(property, value)
