extends Node

@export var score_goal : int
@export var total_coins : int

var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var end_label: Label = $"../Labels/EndLabel"
@onready var tile_map: TileMap = $"../TileMap"

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " out of " + str(total_coins) + " coins."

func _process(delta: float) -> void:
	if score >= score_goal:
		end_label.text = "Congradulations!\nThe goal was : " + str(score_goal)
		tile_map.layers
	else:
		end_label.text = "Uh-oh!\nThe goal is : " + str(score_goal)
