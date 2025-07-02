extends Node2D

@onready var seed_sample := $seed_sprite

@onready var seeds := [
	$seed_sprite1,
	$seed_sprite2,
	$seed_sprite3,
	$seed_sprite4,
	$seed_sprite5
]

var seed1 := [
	Vector2(-34, -26),
	Vector2(40, -45),
	Vector2(16, 8),
	Vector2(-45, 33),
	Vector2(44, 45)
]

var seed2 := [
	Vector2(22, -45),
	Vector2(-39, -17),
	Vector2(-29, 39),
	Vector2(44, 27)
]

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if rng.randi_range(1,0) == 1:
		for idx in range(len(seed1)):
			seeds[idx].position = seed1[idx]
			seeds[idx].rotation_degrees = rng.randf_range(0, 360)
			seeds[idx].show()
	else:
		for idx in range(len(seed2)):
			seeds[idx].position = seed2[idx]
			seeds[idx].rotation_degrees = rng.randf_range(0, 360)
			seeds[idx].show()
	
