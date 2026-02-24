extends Node

var fullscreen = false;
var sound = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_new_game_pressed() -> void:
	pass # Replace with function body.

func _on_button_continue_pressed() -> void:
	pass # Replace with function body.

func _on_button_settings_pressed() -> void:
	$Settings_Popup.show()

func _on_settings_back_pressed() -> void:
	$Settings_Popup.hide()

# TODO: TURN SOUNDS ON AND OFF 
func _on_sound_button_pressed() -> void:
	if(sound):
		$Settings_Popup/Settings_Buttons/Sound_Settings/Sound_Button.text="OFF"
		sound = false;
	else:
		$Settings_Popup/Settings_Buttons/Sound_Settings/Sound_Button.text="ON"
		sound = true;

func _on_fullscreen_button_pressed() -> void:
	if(fullscreen):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$Settings_Popup/Settings_Buttons/Fullscreen_Settings/Fullscreen_Button.text="ENABLE"
		fullscreen = false;
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$Settings_Popup/Settings_Buttons/Fullscreen_Settings/Fullscreen_Button.text="DISABLE"
		fullscreen = true;

func _on_button_about_pressed() -> void:
	$About_Popup.show()

func _on_about_back_pressed() -> void:
	$About_Popup.hide()



func _on_button_exit_pressed() -> void:
	get_tree().quit()
