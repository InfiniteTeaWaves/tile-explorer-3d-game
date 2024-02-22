extends Node3D

signal tile_locked(locked: bool)
signal on_move_tile_clicked(tile_properties: TileProperties, camera)
signal moved_to_new_tile(tile)

var current_move_panel

var toggled_on: bool
var tile_locked_mode: bool = false

var current_tile: Node3D
var last_tile: Node3D
var tile_base_position_y = 0
var tile_offset_y = 0.5

@onready var cameraBase = $CameraBase # in eigene Scene machen
@onready var hud = $HUD
@onready var world_dynamic = $WorldDynamic #for created tiles
@onready var player = $Player #Player dynamisch laden?

func _ready():
	hud.connect("change_global_time", self._change_global_time)
	hud.connect("show_interaction_main", self._on_show_interaction_main)
	hud.connect("show_interaction_start", self._on_show_interaction_start)
	self._create_world();
	self._set_player_init()

func _on_BasicTile_clicked(clicked_tile):
	if current_tile == clicked_tile:
		return #Aufpassen hier
	if tile_locked_mode:
		hud.set_clicked_tile_info_text(clicked_tile.tile_properties)
		return
	current_tile = clicked_tile
	self._reset_tile_position_y(clicked_tile)
	hud.set_clicked_tile_info_text(clicked_tile.tile_properties)
	self._set_move_panel(clicked_tile)
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
	
func _set_move_panel(tile):
	self._remove_move_panel()
	var move_panel_scene = preload("res://UI/move_panel.tscn")
	current_move_panel = move_panel_scene.instantiate()
	self.add_child(current_move_panel) 
	current_move_panel.connect("move_to_new_tile", self._move_player_to_new_tile)
	#theoretisch einfach Methode, da ich sowieso hier was aufbaue
	emit_signal("on_move_tile_clicked", tile, cameraBase.camera_3d)	

func _move_player_to_new_tile(i_tile):
	emit_signal("moved_to_new_tile", i_tile)
	pass

func _remove_move_panel():
	if current_move_panel:
		current_move_panel.queue_free()
		
func _set_player_init():
	#player forest NICHT dynamisch laden und erst erstellen (ist eingehängt)\
	
	#start tile will be set during creation, this is a WORKAROUND
	var world_dynamic = $WorldDynamic
	var world_editor = $WorldEditor
	var node
	var start_tile
	if world_dynamic.visible:
		node = world_dynamic
	else:
		node = world_editor
	for tile in node.get_children():
		if tile.position.x == 0 and tile.position.z == 0:
			start_tile = tile
			break
	if start_tile:
		player._set_start_parameter(self, start_tile)
	else:
		print("ERROR NO START TILE")


