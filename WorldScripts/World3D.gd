extends Node3D

#@onready var Tiles = $GameMap/Sample/ObhjectsSplineSample3D
var last_tile
var tile_base_position_y = 0
var tile_offset_y = 0.5

@onready var cameraBase = $CameraBase

func _ready():
	_create_world();

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

func _on_BasicTile_clicked(clicked_tile):
	_reset_tile_position_y(clicked_tile)
	#clicked_tile.AnimationOutline.play("HoverFade")
	var panel = $TileText/TileTextPanel
	var label = $TileText/TileTextPanel/TileTextLabel
	label.text = str(clicked_tile.biome_data.game_name)
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
	
func _create_world():
	var world_creator = WorldCreator.new();
	#var world_array = world_creator.create_map_plain(); #second way
	var world_array = world_creator.create_map_from_2d_tilemap($Node2DMap/TileMap);
	
	if world_array:
		for item in world_array:
			var biome_name = item["biome"]
			var biome_data = BiomeResourceLoader.get_biome_data(biome_name)
			var basic_tile = TileCreator.new(biome_data).create_tile_from_biome_data()
			_add_tile_to_world(item.x * 10 , item.z * 10 , basic_tile)
		
func _add_tile_to_world(x, z, basic_tile):
	basic_tile.position = Vector3(x, 0, z)  # Set the position
	basic_tile.connect("on_click", _on_BasicTile_clicked)
	basic_tile.connect("on_double_click", _on_BasicTile_double_clicked)
	basic_tile.connect("on_hover_entry", _on_BasicTile_hover_entry)
	basic_tile.connect("on_hover_exit", _on_BasicTile_hover_exit)
	self.add_child(basic_tile)
	

