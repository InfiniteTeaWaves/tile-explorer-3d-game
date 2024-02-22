extends Node3D

signal update_header(rounds, distance)

var init = false
var world
var start_tile
var player_tile

var rounds: int
var distance: int

func _ready():
	pass

func _set_start_parameter(i_world, i_start_tile):
	world = i_world
	start_tile = i_start_tile
	player_tile = start_tile
	world.connect("moved_to_new_tile", self._player_moved)
	init = true
	pass

func _process(_delta):
	if !init:
		return
	pass
	#var input = {
		#"up": Input.is_action_pressed("move_up"),
		#"down": Input.is_action_pressed("move_down"),
		#"left": Input.is_action_pressed("move_left"),
		#"right": Input.is_action_pressed("move_right"),	
	#}

func _player_moved(tile_moved_to):
	rounds += 1
	player_tile = tile_moved_to
	var tile_moved_to_2d= Vector2(tile_moved_to.position.x, tile_moved_to.position.z)
	var start_tile_2d = Vector2(start_tile.position.x, start_tile.position.z)
	distance = tile_moved_to_2d.distance_to(start_tile_2d) /10
	emit_signal("update_header",rounds, distance)
