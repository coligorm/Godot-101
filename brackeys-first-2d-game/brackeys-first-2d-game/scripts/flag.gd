extends Area2D

@onready var game_manager: Node = %GameManager
@onready var level_completed: AudioStreamPlayer2D = $LevelComplete
@onready var hurt: AudioStreamPlayer = $Hurt

func _on_body_entered(body: Node2D) -> void:
	if game_manager.level_completed_check():
		level_completed.play()
	else:
		# Level Incomplete: Play the tone lower, slower and for half the jingle
		level_completed.set_pitch_scale(0.25)
		level_completed.play()
		await get_tree().create_timer(level_completed.stream.get_length()).timeout
		level_completed.stop()
