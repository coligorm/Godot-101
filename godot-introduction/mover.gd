extends Sprite2D

var speed : float = 100.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 400
	position.y = 400
	position = Vector2(500,200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2(1, 1)
	position += direction * delta * speed
