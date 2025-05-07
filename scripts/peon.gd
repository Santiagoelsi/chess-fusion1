extends Node2D

@onready var Click_Arena = $ClickArena

var selected = false
var tile_size = 64
var direction = -1 # Cambia a 1 si es del otro equipo

func _ready():
	Click_Arena.connect("input_event", _on_click)

func _on_click(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		selected = true

func _unhandled_input(event):
	if selected and event is InputEventMouseButton and event.pressed:
		var from = (position / tile_size).floor()
		var to = (get_global_mouse_position() / tile_size).floor()
		var dx = to.x - from.x
		var dy = to.y - from.y

		# Movimiento de 1 hacia adelante
		if dx == 0 and dy == direction:
			global_position = to * tile_size
			selected = false
