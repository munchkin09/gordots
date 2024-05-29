extends Control

@onready var pause_menu : GridContainer = get_node("PauseGridContainer")
@onready var settings_menu : GridContainer = get_node("SettingsGridContainer")

func _ready():
	process_mode= Node.PROCESS_MODE_ALWAYS 
	
func _on_resume_button_pressed():
	GameStateMachine.current_state.Transitioned.emit(GameStateMachine.current_state, 'startlevelstate')
	queue_free()

func _on_settings_button_pressed():
	pause_menu.hide()
	settings_menu.show() # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
