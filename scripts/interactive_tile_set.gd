extends StaticBody2D

signal flower_pressed(coords:Vector2)

@onready var default_sprite := $default_sprite
@onready var hover_sprite := $hover_sprite
@onready var selected_sprite := $selected_sprite
@onready var flower_sprite := $flower_sprite
@onready var seed_sprite := $seed_sprite

var is_mouse_inside := false
var is_selected := false
var is_allow := false

func _ready():
	default_sprite.show()
	hover_sprite.hide()
	selected_sprite.hide()
	seed_sprite.hide()

func _process(delta):
	if Input.is_action_just_released("mouse_click") and is_mouse_inside:
		print("Wow, a left mouse click", position/128)

		selected_sprite.show()
		default_sprite.hide()
		hover_sprite.hide()
		flower_sprite.show()

		is_selected = true
		is_mouse_inside = false

		flower_pressed.emit(position/128)

func _on_mouse_entered() -> void:
	if not is_selected:
		is_mouse_inside = true
		default_sprite.hide()
		hover_sprite.show()

func _on_mouse_exited() -> void:
	if not is_selected:
		is_mouse_inside = false
		default_sprite.show()
		hover_sprite.hide()

func show_seed():
	seed_sprite.show()
	
