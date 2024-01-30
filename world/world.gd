extends Node3D

@onready var cameraBase = $CameraBase # in eigene Scene machen
@onready var hud = $HUD
@onready var world_dynamic = $WorldDynamic #for created tiles

var toggled_on: bool
var last_tile: Node3D
var tile_base_position_y = 0
var tile_offset_y = 0.5

func _ready():
	hud.connect("change_global_time", self._change_global_time)
	self._create_world();
	self._add_editor_tiles_to_world()

func _process(delta):
	pass
	
func _input(event):
	pass

func _on_BasicTile_clicked(clicked_tile):
	_reset_tile_position_y(clicked_tile)
	hud.set_clicked_tile_text(clicked_tile.biome_properties)
	print("click")

func _on_BasicTile_double_clicked(clicked_tile):
	cameraBase.set_position_to_clicked_tile(clicked_tile)
	print("double click")
	#hier erste Logik bauen , Unterscheidung ob Player derauf oder nicht, ansonsten 
	#move berechnen

func _on_BasicTile_hover_entry(hovered_tile):
	hud.set_tile_hovered_text_entry(hovered_tile)

func _on_BasicTile_hover_exit(hovered_tile):
	hud.set_tile_hovered_text_exit(hovered_tile)

func _reset_tile_position_y(clicked_tile):
	print("Tile clicked in World.gd:", clicked_tile)
	if last_tile != clicked_tile:
		if last_tile:
			last_tile.reset_tile()
			last_tile.AnimationOutline.stop()
	last_tile = clicked_tile	
	
func _open_dialog_for_action():
	print("double click")

func _on_button_close_tiletext_pressed():
	hud.hide_panel_after_button_close()
	
func _create_world():
	var world_creator = WorldCreator.new(); #creates the map
	var world_array = world_creator.create_map_from_2d_tilemap($TileMap2D/TileMap);
	
	if world_array:
		for item in world_array:
			var biome_name = item["biome"]
			var biome_properties = BiomeResourceLoader.get_biome_properties(biome_name)
			var biome_data = BiomeResourceLoader.get_biome_data(biome_name)
			if biome_properties:
				var basic_tile = TileCreator.new(biome_properties, biome_data).create_tile_from_biome()
				self._add_tile_to_world(item.x * 10 , item.z * 10 , basic_tile)
		
func _add_tile_to_world(x, z, basic_tile): #gehört eigentlich in ein world creator script
	#var basic_tile = base_tile.get_node("BasicTile")
	basic_tile.position = Vector3(x, 0, z)  # Set the position
	self._connect_basic_tile_methods(basic_tile)
	world_dynamic.add_child(basic_tile)

func _add_editor_tiles_to_world(): #gehört eigentlich in ein world creator script
	var world_editor = $WorldEditor
	for basic_tile in world_editor.get_children():
		self._connect_basic_tile_methods(basic_tile)

func _connect_basic_tile_methods(basic_tile):
	basic_tile.connect("on_click", self._on_BasicTile_clicked)
	basic_tile.connect("on_double_click", self._on_BasicTile_double_clicked)
	basic_tile.connect("on_hover_entry", self._on_BasicTile_hover_entry)
	basic_tile.connect("on_hover_exit", self._on_BasicTile_hover_exit)	

func _change_global_time(toggled):
	var main_light = $CameraBase/MainLight
	var environment = $WorldEnvironment.get_environment()
	var color: Color
	if toggled: #night
		main_light.light_energy = 0.2		#Schatten von anderen Seite (Mond!)
		#Ambient light von environment setzen da kein Schatten
		environment.set_bg_color(color.html("#1f515e"))
	else: #day
		main_light.light_energy = 0.4	
		environment.set_bg_color(color.html("#57afc7"))
