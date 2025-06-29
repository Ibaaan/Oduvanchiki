extends StaticBody2D

signal flower_pressed(coords:Vector2)

@onready var default_sprite1 := $default_sprite1
@onready var default_sprite2 := $default_sprite2
@onready var hover_sprite := $hover_sprite
@onready var selected_sprite := $selected_sprite
@onready var flower_sprite := $flower_sprite
@onready var seed_sprite := $seed_sprite

var is_mouse_inside := false
var is_selected := false
var is_allow := false

var color_id := 1

func _ready() -> void:
	show_default()
	hover_sprite.hide()
	selected_sprite.hide()
	seed_sprite.hide()

func _process(delta):
	if Input.is_action_just_released("mouse_click") and is_mouse_inside and StateManager.is_state_flower():
		print(StateManager.state, position/128)

		#selected_sprite.show()
		show_default()
		hover_sprite.hide()
		seed_sprite.hide()
		flower_sprite.show()

		is_selected = true
		is_mouse_inside = false

		flower_pressed.emit(position/128)

func _on_mouse_entered() -> void:
	if not is_selected and StateManager.is_state_flower():
		is_mouse_inside = true
		#hide_default()
		hover_sprite.show()

func _on_mouse_exited() -> void:
	if not is_selected and StateManager.is_state_flower():
		is_mouse_inside = false
		#show_default()
		hover_sprite.hide()

func show_seed():
	if not flower_sprite.is_visible_in_tree():
		seed_sprite.show()

func set_color(val:int):
	color_id = val % 2

func show_default():
	if color_id == 1:
		default_sprite2.hide()
		default_sprite1.show()
	else:
		default_sprite2.show()
		default_sprite1.hide()

func hide_default():
		default_sprite2.hide()
		default_sprite1.hide()
