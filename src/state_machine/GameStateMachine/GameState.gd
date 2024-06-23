class_name GameState extends Node

var current_state
var states: Dictionary = {}
var history: Array[String] = []
var selectlevelstate = SelectLevelState.new()
var startlevelstate = StartLevelState.new()
var playinglevelstate = PlayingLevelState.new()
var gameoverstate  = GameOverState.new()
var pausestate = PauseState.new()
var initial_state = BaseStateClass.new()
var initial_menu = 'res://src/Scenes/Menus/Initial.tscn'

var DEBUG: bool = false
var ACTIVATE_HISTORY: bool = false
var PRINT_HISTORY: bool = false
var health_controller: HealthController
const logDuckHeader = '🖥️🤖'

var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	health_controller = HealthController.new()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if not current_state:
		return
	current_state.process(delta)

func _physics_process(delta):
	if not current_state:
		return
	current_state.physics_process(delta)

func on_child_transition(state: BaseStateClass, newState: String):
	Log.call('Changing to', newState)
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

func startStateMachine(node: Node2D):
	current_state = initial_state
	states['selectlevelstate'] = selectlevelstate
	states['startlevelstate'] = startlevelstate
	states['playinglevelstate'] = playinglevelstate
	states['gameoverstate'] = gameoverstate
	states['pausestate'] = pausestate
	selectlevelstate.Transitioned.connect(on_child_transition)
	startlevelstate.Transitioned.connect(on_child_transition)
	playinglevelstate.Transitioned.connect(on_child_transition)
	pausestate.Transitioned.connect(on_child_transition)
	pausestate.configure(node)
	selectlevelstate.configure(node)
	gameoverstate.configure(node)
	self.changeSceneTo(initial_menu)

func changeSceneTo(scene_path: String):
	selectlevelstate.setLevelTo(scene_path)
	selectlevelstate.enter()

func restart_scene():
	var scene_path = get_tree().current_scene.scene_file_path
	changeSceneTo(scene_path)
