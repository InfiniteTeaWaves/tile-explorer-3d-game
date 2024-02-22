extends Node2D

signal move_to_new_tile(new_tile)

var move_tile
var camera

#position abhängig von zoomStufe, zoom triggered event

@onready var parent = get_parent()
@onready var panel = $PanelContainer
@onready var button = $PanelContainer/TravelButton

func _ready():
	parent.connect("on_move_tile_clicked", self._on_tile_clicked)
	pass # Replace with function body.

func _on_tile_clicked(i_move_tile, i_camera):
	move_tile = i_move_tile
	camera = i_camera

func _process(delta):
	if camera and move_tile:
		var screen_position = camera.unproject_position(move_tile.global_transform.origin)	
		screen_position.y += -100
		panel.position = screen_position

func _on_travel_button_pressed():
	#later, open travel panel here, but first, lets skip this step and do it for free
	
	#WORKAROUND
	emit_signal("move_to_new_tile",move_tile)
	
	pass # Replace with function body.
