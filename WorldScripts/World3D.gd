extends Node3D

#@onready var Tiles = $GameMap/Sample/ObhjectsSplineSample3D
var last_tile
var tile_base_position_y = 0
var tile_offset_y = 0.5

@onready var cameraBase = $CameraBase

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

func _process(delta):
	pass
	
func _input(event):
	# close TileText
	var input = {"esc": Input.is_action_pressed("Exit")}
	if input["esc"]:
		var panel = $TileText/TileTextPanel
		if panel.visible:
			panel.hide()	
		else:
			pass #Exit Game	

func create_basic_tile(x,z, color):
	var basic_tile_scene = load("res://basicTile.tscn")
	var basic_tile = basic_tile_scene.instantiate()
	var tile_props = TileProperties.new(color, "OtherProperty")
	basic_tile.create_ground_tile(tile_props)
	self.add_child(basic_tile)
	basic_tile.position = Vector3(x, 0, z)  # Set the position
	basic_tile.connect("on_click", _on_BasicTile_clicked)
	basic_tile.connect("on_double_click", _on_BasicTile_double_clicked)
	basic_tile.connect("on_hover_entry", _on_BasicTile_hover_entry)
	basic_tile.connect("on_hover_exit", _on_BasicTile_hover_exit)
	
func _on_BasicTile_clicked(clicked_tile):
	_reset_tile_position_y(clicked_tile)
	#clicked_tile.AnimationOutline.play("HoverFade")
	var panel = $TileText/TileTextPanel
	var label = $TileText/TileTextPanel/TileTextLabel
	label.text = str(clicked_tile)
	panel.show()
	

func _on_BasicTile_double_clicked(clicked_tile):
	cameraBase.position.x = clicked_tile.position.x
	cameraBase.position.z = clicked_tile.position.z
	#all tiles get triggered somehow when this event is provided
#	print("Tile clicked in World.gd:", clicked_tile)
	print("double click")
	pass

func _on_BasicTile_hover_entry(hovered_tile):
	#auslagern
	var panel = $TileInfo/TileInfoPanel
	var label = $TileInfo/TileInfoPanel/TileInfoLabel
	label.text = "Tile (" + str(hovered_tile.position.x) + ", " + str(hovered_tile.position.z) + ")"
	#panel.rect_global_position = hovered_tile.position  # Adjust the offset as needed
	panel.show()

func _on_BasicTile_hover_exit(hovered_tile):
	#auslagern
	var panel = $TileInfo/TileInfoPanel
	panel.hide()

func _reset_tile_position_y(clicked_tile):
	print("Tile clicked in World.gd:", clicked_tile)
	if last_tile != clicked_tile:
		if last_tile:
			last_tile.reset_position_y()
			last_tile.AnimationOutline.stop()
	last_tile = clicked_tile	
	
func _open_dialog_for_action():
	print("double click")
	

func _on_button_close_tiletext_pressed():
	var panel = $TileText/TileTextPanel
	panel.hide()	
	
