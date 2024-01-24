@tool
extends EditorScript

#cust resources
var tile_properties: TileProperties
var biome_data: BiomeData

#scenes
var ground_tile_scene: PackedScene
var basic_tile_scene: PackedScene

#nodes
var ground_tile
var basic_tile

func _run():
	self._load_res()
	if tile_properties == null or biome_data == null:
		return
	self._load_base()
	basic_tile = self._create_tile()
	print("basic tile created: ", basic_tile)
	#var basic_tile = TileCreator.new(biome_data).create_tile_from_biome_data()
	#print(basic_tile)
	var world = EditorInterface.get_edited_scene_root().find_node("WorldEditor")
	#print("success")
	#world.add_child(basic_tile)
	
func _load_res():
	biome_data = load("res://biomes/biomes_res/forest_birch_0.tres")
	tile_properties = load("res://tiles/tiles_res/forest_pine_snow_campfire.tres")
	print("cust res loaded: ", tile_properties.tile_name, biome_data.biome_name)
	
func _load_base():
	basic_tile_scene = load("res://tiles/base/basicTile.tscn")
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")
	print("base scenes loaded: ", basic_tile_scene, ground_tile_scene)

func _create_tile():
	basic_tile = basic_tile_scene.instantiate()
	print("basic tile instantiated", basic_tile)
	print("basic script: ",basic_tile.get_script()) 
	print("basic class: ",basic_tile.get_class())
	basic_tile.set_biome_data(biome_data)
	print("biome data added")
	self._add_ground_tile();
	print("ground tile added")
	self._add_tile_properties();
	print("tile properties added")
	return basic_tile

func _add_ground_tile():
	var ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_biome_data(biome_data) #problerm here
	ground_tile.create_ground_tile()
	basic_tile.add_child(ground_tile)
	
func _add_tile_properties(): #erstmal Test ob geladen wird
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	basic_tile.add_child(socket)
