extends Node


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

func _on_button_about_pressed() -> void:
	$About_Popup.show()

func _on_about_back_pressed() -> void:
	$About_Popup.hide()



func _on_button_exit_pressed() -> void:
	get_tree().quit()
