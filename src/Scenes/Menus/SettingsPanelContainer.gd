extends PanelContainer

@export var action_items: Array[String]

@onready var settings_grid_container = %SettingsVBoxContainer
@onready var controller_setup_grid_container = %ControllersVBoxContainer
@onready var MAIN_AUDIO_BUS_ID = AudioServer.get_bus_index("Master")
@onready var return_button = %ReturnToSettingsButton
@onready var controllers_menu = $VBoxContainer/ControllersVBoxContainer

signal return_from_menu

func _ready():
	create_action_remap_items()
	
func create_action_remap_items() -> void:
	var previous_item = controller_setup_grid_container.get_child(controller_setup_grid_container.get_child_count() - 1)
	for index in range(action_items.size()):
		var action = action_items[index]		
		var label = Label.new()
		label.text = action
		controller_setup_grid_container.add_child(label)
		var button = RemapButton.new()
		button.action = action
		button.focus_neighbor_top = previous_item.get_path()
		previous_item.focus_neighbor_bottom = button.get_path()
		if index == action_items.size() - 1:
			return_button.focus_neighbor_top = button.get_path()
			button.focus_neighbor_bottom = return_button.get_path()
		previous_item = button

		controller_setup_grid_container.add_child(button)


func _on_remap_controllers_button_pressed():
	settings_grid_container.hide()
	controller_setup_grid_container.show()

func _on_return_to_settings_button_pressed():
	controller_setup_grid_container.hide()
	settings_grid_container.show()
	


func _on_retun_button_pressed():
	return_from_menu.emit()
	


func _on_sound_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MAIN_AUDIO_BUS_ID,linear_to_db(value))
	AudioServer.set_bus_mute(MAIN_AUDIO_BUS_ID, value < .05)
