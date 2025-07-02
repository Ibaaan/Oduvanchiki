extends Node2D

@onready var base_level : = $BaseLevel
var level := 0
const ideal_directions := {
	Vector2(1, 0) : false,
	Vector2(-1, 0) : false,
	Vector2(0, 1) : false,
	Vector2(0, -1) : false,
	Vector2(1, 1) : false,
	Vector2(1, -1) : false,
	Vector2(-1, 1) : false,
	Vector2(-1, -1) : false
}

var used_directions : Dictionary = ideal_directions.duplicate(true)

func _ready() -> void:
	_on_won_level()

func _on_wind_wind_direction(direction: Vector2) -> void:
	if StateManager.is_state_wind():
		#print(direction)
		
		if used_directions[direction]:
			print("NONONONO")
			return
		
		used_directions[direction] = true
		base_level.place_seeds(direction)
		print("Change to on just cool")
		StateManager.change_state_to_flower()
		
	if base_level.is_fulled():
		_on_won_level()


func _on_base_level_flower_pressed() -> void:
	if base_level.is_fulled():
		_on_won_level()
	print("Change to on ")
	StateManager.change_state_to_wind()

func _on_won_level():
	base_level.hide()
	level += 1
	base_level.set_grid_by_level(level)
	used_directions = ideal_directions.duplicate(true)
	print("Change to on win")
	StateManager.change_state_to_flower()
	base_level.show()
	
