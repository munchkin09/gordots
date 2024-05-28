extends Control

func _ready():
	process_mode= Node.PROCESS_MODE_ALWAYS 

func _on_resume_button_pressed():
	pass # Replace with function body.

func _on_settings_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
