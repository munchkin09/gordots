extends Control

@onready var pause_menu : GridContainer = get_node("PauseGridContainer")
@onready var settings_menu : GridContainer = get_node("SettingsGridContainer")

func _ready():
	process_mode= Node.PROCESS_MODE_ALWAYS
	settings_menu.get_node("SettingsPanelContainer").get_node("Sprite2D").hide() 
	
func _on_resume_button_pressed():
	GameStateMachine.current_state.Transitioned.emit(GameStateMachine.current_state, 'startlevelstate')
	pause_menu.hide()

func _on_settings_button_pressed():
	pause_menu.hide()
	settings_menu.show() 
	
func _on_quit_button_pressed():
	get_tree().quit()

func _on_settings_panel_container_return_from_menu():
	settings_menu.hide()
	pause_menu.show()
	 
