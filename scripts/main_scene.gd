extends Node2D

enum gameState{
	PLACE_FLOWER,
	CHOOSE_WIND_DIRECTION
}

var state := gameState.PLACE_FLOWER

@onready var base_level : = $BaseLevel
@onready var wind : = $Wind


func _on_wind_wind_direction(direction: Vector2) -> void:
	print(direction)
	base_level.place_seeds(direction)
	state = gameState.PLACE_FLOWER


func _on_chosen_tile() -> void:
	
	state = gameState.CHOOSE_WIND_DIRECTION
