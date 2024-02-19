extends Node3D

signal tile_locked(locked: bool)

@onready var cameraBase = $CameraBase # in eigene Scene machen
@onready var hud = $HUD
@onready var world_dynamic = $WorldDynamic #for created tiles

var toggled_on: bool
var tile_locked_mode: bool = false
#tile data
#var tile_locked: bool = false
var current_tile: Node3D
var last_tile: Node3D
var tile_base_position_y = 0
var tile_offset_y = 0.5

func _ready():
	hud.connect("change_global_time", self._change_global_time)
	hud.connect("show_interaction_main", self._on_show_interaction_main)
	hud.connect("show_interaction_start", self._on_show_interaction_start)
	self._create_world();

func _on_BasicTile_clicked(clicked_tile):
	if tile_locked_mode:
		hud.set_clicked_tile_info_text(clicked_tile.tile_properties)
		return
	current_tile = clicked_tile
	_reset_tile_position_y(clicked_tile)
	hud.set_clicked_tile_info_text(clicked_tile.tile_properties)
	hud.show_start_panel(clicked_tile)
	print("click")

func _on_BasicTile_double_clicked(clicked_tile):
	cameraBase.set_position_to_clicked_tile(clicked_tile)
	print("double click")
	#if player is here

func _on_BasicTile_hover_entry(hovered_tile):
	hud.set_tile_hovered_location_entry(hovered_tile)

func _on_BasicTile_hover_exit(hovered_tile):
	hud.set_tile_hovered_location_exit(hovered_tile)

func _reset_tile_position_y(clicked_tile):
	print("Tile clicked in World.gd:", clicked_tile)
	if last_tile != clicked_tile:
		if last_tile:
			last_tile.reset_tile()
			last_tile.AnimationOutline.stop()
	last_tile = clicked_tile	
	
func _on_button_close_tiletext_pressed():
	hud.hide_panel_after_button_close()
	
func _create_world(): 
	var world_creator = WorldCreator.new(self);
	world_creator.create_editor_world($WorldEditor)
	world_creator.create_dynamic_world($WorldDynamic, $TileMap2D/TileMap)

func _change_global_time(toggled):
	var main_light = $CameraBase/MainLight
	var environment = $WorldEnvironment.get_environment()
	if toggled: #night
		main_light.light_energy = 0.2		#Schatten von anderen Seite (Mond!)
		#Ambient light von environment setzen da kein Schatten
		environment.set_bg_color(Color.html("#1f515e"))
	else: #day
		main_light.light_energy = 0.4	
		environment.set_bg_color(Color.html("#57afc7"))

func _on_show_interaction_main():
	self.set_tile_locked(true)
	cameraBase.set_position_to_clicked_tile(current_tile)
	
	#hier ggf. interaction data zeigen statt tile
	#Interaction.new(current_tile) (biome data und tile properties nehmen)
	var tile_properties = current_tile.tile_properties
	hud.show_interaction_panel(tile_properties)
	#self.current_tile 
	
func _on_show_interaction_start():
	self.set_tile_locked(false)
	
func set_tile_locked(locked: bool):
	emit_signal("tile_locked", locked)
	tile_locked_mode = locked
	
