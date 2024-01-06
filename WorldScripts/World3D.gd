extends Node3D

#@onready var Tiles = $GameMap/Sample/ObhjectsSplineSample3D
var last_tile
var tile_base_position_y = 0
var tile_offset_y = 0.5

func _ready():
#	for item in Tiles.get_children():
#		item.connect("on_click", self, "_on_spline_forest_5_on_click")
#		pass	
	create_basic_tile(0,10, Color(0.25, 0.75, 0.25)) 
	create_basic_tile(0,0, Color(0.25, 0.75, 0.25)) 
	create_basic_tile(0,-10, Color(0.25, 0.75, 0.25)) 
	create_basic_tile(10,10, Color(1, 1, 1)) 
	create_basic_tile(10,0, Color(1, 1, 1)) 
	create_basic_tile(10,-10, Color(1, 1, 1)) 
	create_basic_tile(-10,10, Color(0.95, 0.85, 0.65)) 
	create_basic_tile(-10,0, Color(0.95, 0.85, 0.65)) 
	create_basic_tile(-10,-10, Color(0.95, 0.85, 0.65))
	
	#nur über den Array loopen und aus dem Array die infos
	#in tile map properties ziehen

func _process(delta):
	pass

func _on_basic_tile_on_click(BasicTile):
	print("Generated Tile")
#	for item in Tiles.get_children():
#		item.hide()
#		pass	
##	Tiles.hide()
#	Tile.show()

func create_basic_tile(x,z, color):
	var basic_tile_scene = load("res://basicTile.tscn")
	var basic_tile = basic_tile_scene.instantiate()
	var tile_props = TileProperties.new(color, "OtherProperty")
	basic_tile.create_ground_tile(tile_props)
	self.add_child(basic_tile)
	basic_tile.position = Vector3(x, 0, z)  # Set the position
	basic_tile.connect("on_click", _on_BasicTile_clicked)
	basic_tile.connect("on_double_click", _on_BasicTile_double_clicked)
	
func _on_BasicTile_clicked(clicked_tile):
	_reset_tile_position_y(clicked_tile)

func _on_BasicTile_double_clicked(clicked_tile):
	#all tiles get triggered somehow when this event is provided
#	print("Tile clicked in World.gd:", clicked_tile)
#	print("double click")
	pass
	
func _reset_tile_position_y(clicked_tile):
	print("Tile clicked in World.gd:", clicked_tile)
	if last_tile != clicked_tile:
		if last_tile:
			last_tile.reset_position_y()
	last_tile = clicked_tile	
	
func _open_dialog_for_action():
	print("double click")
	
