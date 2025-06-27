extends Node2D

@onready var base_level : = $BaseLevel


func _on_wind_wind_direction(direction: Vector2) -> void:
	if StateManager.is_state_wind():
		print(direction)
		base_level.place_seeds(direction)
		StateManager.change_state_to_flower()
		
	if base_level.is_fulled():
		print("URA POBEDA")


func _on_base_level_flower_pressed() -> void:
	if base_level.is_fulled():
		print("URA POBEDA")
	
	StateManager.change_state_to_wind()
