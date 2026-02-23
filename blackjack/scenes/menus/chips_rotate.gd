extends Node3D

@export var turn_speed = 3;

func _process(delta: float) -> void:
	rotation.y += deg_to_rad(turn_speed) * delta;
