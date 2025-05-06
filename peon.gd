extends Area2D

var has_moved = false
var grid_size = 64  # Tamaño de una casilla

func _ready():
	set_process_input(true)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		move_forward()

func move_forward():
	var move_distance = grid_size if has_moved else grid_size * 2
	position.y -= float(move_distance)
	has_moved = true


func on_click_arena_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
