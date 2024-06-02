extends Node2D

var path = 'res://src/Scenes/Level1/Level1_1.tscn'
@onready var animation : AnimatedSprite2D = get_node("MainMenuPanelContainer/AnimatedSprite2D")
@onready var settings_animation : Sprite2D = get_node("SettingsPanelContainer/Sprite2D")
@onready var color : ColorRect =  get_node("ColorRect")
@onready var v_box_container = get_node("MainMenuPanelContainer/VBoxContainer/ButtonsVBoxContainer")
@onready var MAIN_AUDIO_BUS_ID = AudioServer.get_bus_index("Master")
@onready var settings_panel : PanelContainer =  get_node("SettingsPanelContainer")
@onready var main_panel : PanelContainer =  get_node("MainMenuPanelContainer")
@onready var music : AudioStreamPlayer2D =  $AudioStreamPlayer2D
@onready var audio_slider : HSlider =  $SettingsPanelContainer/VBoxContainer/ButtonsVBoxContainer/SoundHSlider

func _ready():
	animation.play()
	focus_button()
	music.play()
	
	
func _draw():	
	self.position = get_viewport_rect().size / 2
	color.custom_minimum_size =  get_viewport().size
	animation.scale =  get_viewport().size / Vector2i(128,128)
	settings_animation.scale =  get_viewport().size / Vector2i(128,128)
	 	
func _on_button_pressed():
	GameStateMachine.changeSceneTo(path)

func _on_button_3_pressed():
	get_tree().quit()

func _on_settings_pressed():
	main_panel.hide()
	settings_panel.show()
	
func focus_button(): 
	if v_box_container:
		v_box_container.get_children()
		var button :Button = v_box_container.get_child(0)
		if button is Button:
			button.grab_focus()

func _on_sound_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MAIN_AUDIO_BUS_ID,linear_to_db(value))
	AudioServer.set_bus_mute(MAIN_AUDIO_BUS_ID, value < .05)


func _on_settings_panel_container_return_from_menu():
	main_panel.show()
	settings_panel.hide()
