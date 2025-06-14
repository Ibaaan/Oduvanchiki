extends Node2D

signal wind_direction(direction:Vector2)


func _on_right_button_up() -> void:
	wind_direction.emit(Vector2(1, 0))


func _on_up_button_up() -> void:
	wind_direction.emit(Vector2(0, -1))


func _on_left_button_up() -> void:
	wind_direction.emit(Vector2(-1, 0))


func _on_down_button_up() -> void:
	wind_direction.emit(Vector2(0, 1))


func _on_up_right_button_up() -> void:
	wind_direction.emit(Vector2(1, -1))


func _on_up_left_button_up() -> void:
	wind_direction.emit(Vector2(-1, -1))


func _on_down_right_button_up() -> void:
	wind_direction.emit(Vector2(1, 1))


func _on_down_left_button_up() -> void:
	wind_direction.emit(Vector2(-1, 1))
