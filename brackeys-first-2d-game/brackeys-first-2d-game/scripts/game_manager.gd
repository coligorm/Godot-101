extends Node

@export var score_goal : int
@export var total_coins : int 

@onready var score_label: Label = $ScoreLabel
@onready var end_label: Label = $"../Labels/EndLabel"
@onready var ui: Label = $"../CanvasLayer/ScoreCounter/UI"

func add_point():
	total_coins += 1
	score_label.text = "You collected " + str(total_coins) + " out of " + str(score_goal) + " coins."

func _process(delta: float) -> void:
	if total_coins >= score_goal:
		end_label.text = "Congradulations!\nThe goal was : " + str(score_goal)
	else:
		end_label.text = "Uh-oh!\nThe goal is : " + str(score_goal)
