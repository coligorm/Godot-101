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
	
	if not game_over:
		print("Go to menu")
	else:
		print("Keep playing")

func _has_won(score : int) -> bool:
	if score >= 100:
		return true
	else:
		return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
