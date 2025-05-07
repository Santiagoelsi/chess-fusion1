extends Node2D

@onready var Click_Arena = $ClickArena
var selected = false
var tile_size = 64

func _ready():
	Click_Arena.connect("input_event", _on_click)

func _on_click(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		selected = true

func _unhandled_input(event):
	if selected and event is InputEventMouseButton and event.pressed:
		var from = (position / tile_size).floor()
		var to = (get_global_mouse_position() / tile_size).floor()
		var dx = abs(to.x - from.x)
		var dy = abs(to.y - from.y)

		if dx == dy:
			global_position = to * tile_size
			selected = false
