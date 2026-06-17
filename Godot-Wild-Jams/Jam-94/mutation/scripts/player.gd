extends CharacterBody2D

var health : float = 100.0
var death_count : int = 0

var can_move : bool = true
var can_attack : bool = true
var is_dead : bool = false

@export var damage : float = 25.0
@export var cooldown_atk : float = 0.5

# temp variable until near enemy is implemented
@export var enemy_close : bool = true

const SPEED = 175.0
const ACCELERATION = 800.0

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	# Handle attack
	if can_attack:
		var input := Input.is_action_just_pressed("attack")
		if input:
			attack()
	else:
		print("Can't attack")
	
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var target_velocity = input_dir * SPEED
	velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)

	move_and_slide()

func attack() -> void:
	print("Attack")
	
	if enemy_close:
		print("Hit")
		deal_damage()
	else:
		print("Miss")
	
	attack_cooldown()

func deal_damage() -> void:
	print("Dealt {can_attack} dmg")

func attack_cooldown() -> void:
	print("waiting")
	can_attack = false
	await get_tree().create_timer(cooldown_atk).timeout
	can_attack = true
	print("can attack again")
	
func receive_dmg(dmg) -> void:
	health -= dmg
	if health <= 0:
		is_dead = true	
