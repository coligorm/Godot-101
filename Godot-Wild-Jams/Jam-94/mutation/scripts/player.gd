extends CharacterBody2D

var can_move : bool = true

const SPEED = 175.0
const ACCELERATION = 800.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var target_velocity = input_dir * SPEED
	velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)

	move_and_slide()
