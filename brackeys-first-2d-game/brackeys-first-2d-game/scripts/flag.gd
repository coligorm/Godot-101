extends Area2D

@onready var game_manager: Node = %GameManager
@onready var level_completed: AudioStreamPlayer2D = $LevelComplete
@onready var hurt: AudioStreamPlayer = $Hurt

func _on_body_entered(body: Node2D) -> void:
	print("entered")
	if game_manager.level_completed_check():
		level_completed.play()
	else:
		hurt.play()
