extends Node3D

var card_textures = ["res://assets/textures/cards/card_clubs_02.png","res://assets/textures/cards/card_clubs_03.png","res://assets/textures/cards/card_clubs_04.png","res://assets/textures/cards/card_clubs_05.png","res://assets/textures/cards/card_clubs_06.png","res://assets/textures/cards/card_clubs_07.png","res://assets/textures/cards/card_clubs_08.png","res://assets/textures/cards/card_clubs_09.png","res://assets/textures/cards/card_clubs_10.png","res://assets/textures/cards/card_clubs_A.png","res://assets/textures/cards/card_clubs_J.png","res://assets/textures/cards/card_clubs_K.png","res://assets/textures/cards/card_clubs_Q.png","res://assets/textures/cards/card_diamonds_02.png","res://assets/textures/cards/card_diamonds_03.png","res://assets/textures/cards/card_diamonds_04.png","res://assets/textures/cards/card_diamonds_05.png","res://assets/textures/cards/card_diamonds_06.png","res://assets/textures/cards/card_diamonds_07.png","res://assets/textures/cards/card_diamonds_08.png","res://assets/textures/cards/card_diamonds_09.png","res://assets/textures/cards/card_diamonds_10.png","res://assets/textures/cards/card_diamonds_A.png","res://assets/textures/cards/card_diamonds_J.png","res://assets/textures/cards/card_diamonds_K.png","res://assets/textures/cards/card_diamonds_Q.png","res://assets/textures/cards/card_empty.png","res://assets/textures/cards/card_hearts_02.png","res://assets/textures/cards/card_hearts_03.png","res://assets/textures/cards/card_hearts_04.png","res://assets/textures/cards/card_hearts_05.png","res://assets/textures/cards/card_hearts_06.png","res://assets/textures/cards/card_hearts_07.png","res://assets/textures/cards/card_hearts_08.png","res://assets/textures/cards/card_hearts_09.png","res://assets/textures/cards/card_hearts_10.png","res://assets/textures/cards/card_hearts_A.png","res://assets/textures/cards/card_hearts_J.png","res://assets/textures/cards/card_hearts_K.png","res://assets/textures/cards/card_hearts_Q.png","res://assets/textures/cards/card_joker_black.png","res://assets/textures/cards/card_joker_red.png","res://assets/textures/cards/card_spades_02.png","res://assets/textures/cards/card_spades_03.png","res://assets/textures/cards/card_spades_04.png","res://assets/textures/cards/card_spades_05.png","res://assets/textures/cards/card_spades_06.png","res://assets/textures/cards/card_spades_07.png","res://assets/textures/cards/card_spades_08.png","res://assets/textures/cards/card_spades_09.png","res://assets/textures/cards/card_spades_10.png","res://assets/textures/cards/card_spades_A.png","res://assets/textures/cards/card_spades_J.png","res://assets/textures/cards/card_spades_K.png","res://assets/textures/cards/card_spades_Q.png"
]

@onready var front = $Front;

@onready var y_pos = 13.7;
@onready var x_pos = -2.8;
@onready var z_pos = 7.6;

# TODO : Fix cards being the same

func set_card(id):
	var image = load(card_textures[id])
	var mat_tmp = front.mesh.get_material();
	var mat_new = mat_tmp.duplicate();
	mat_new.albedo_texture = image;
	front.mesh.set_material(mat_new)
	print("ID %s, image %s, mat_tmp %s, mat_new %s" % [str(id), str(image), str(mat_tmp), str(mat_new)])
	print("/n")
	print("/n")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_card(randi_range(0, card_textures.size()-1))

func _input(event):
	if event.is_action_pressed("ui_accept"):
		set_card(randi_range(0, card_textures.size()-1));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
