extends Node

enum gameState{
	PLACE_FLOWER,
	CHOOSE_WIND_DIRECTION
}

var state = gameState.PLACE_FLOWER


func change_state_to_flower():
	state = gameState.PLACE_FLOWER


func change_state_to_wind():
	state = gameState.CHOOSE_WIND_DIRECTION
	


func is_state_flower():
	return state == gameState.PLACE_FLOWER


func is_state_wind():
	return state == gameState.CHOOSE_WIND_DIRECTION
