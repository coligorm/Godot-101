extends CharacterBody2D

var health : float = 75.0
var death_count : int = 0

var can_move : bool = true
var can_attack : bool = true
var is_dead : bool = false

@export var damage : float = 25.0
@export var cooldown_atk : float = 0.75

# temp variable until near enemy is implemented
@export var player_close : bool = true

const SPEED = 25.0
const ACCELERATION = 100.0

@export var player: CharacterBody2D


func _physics_process(delta: float) -> void:
	print(player.health)
	if is_dead:
		return

	# Movement
	var dir = (global_position.direction_to(player.global_position))
	print(dir)
	
	var target_velocity = dir * SPEED
	print(target_velocity)
	velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)
	
	# Handle attack
	if can_attack and player_close:
		attack()
	else:
		pass
		# print("Mutant: Can't attack")

	move_and_slide()

func attack() -> void:
	pass
		# print("Mutant: Attack")
	
	if player_hit():
		pass
		# print("Mutant: Hit")
		deal_damage()
	else:
		pass
		# print("Mutant: Miss")
	
	attack_cooldown()

func deal_damage() -> void:
	var format_string = "Mutant: Dealt %s dmg."
	var actual_string = format_string % damage
	pass
		# print(actual_string)

func attack_cooldown() -> void:
	pass
		# print("Mutant: waiting")
	can_attack = false
	await get_tree().create_timer(cooldown_atk).timeout
	can_attack = true
	pass
		# print("Mutant: can attack again")
	
func receive_dmg(dmg) -> void:
	health -= dmg
	if health <= 0:
		is_dead = true	

func player_hit() -> bool:
	# CollisionShape2D collision check
	if true:
		return true
	else:
		return false
