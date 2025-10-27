extends Node2D

var score : int = 0
var move_speed : float = 2.5
var game_over : bool = false
var ability : String = "slash"
# Called when the node enters the scene tree for the first time.
func _ready():
	print(score)
	print(move_speed)
	print(game_over)
	print(ability)
	
	score += 10
	print(score)
	score -= 2
	print(score)
	score *= 4
	print(score)
	score /= 2
	print(score)
	
	ability += " attack"
	print(ability)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
