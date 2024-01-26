@tool
extends EditorScript

var basic_tile_scene : PackedScene
var ground_tile_scene: PackedScene
var ground_tile: GroundTile

var biome_data: BiomeData #BiomeProperties?
var tile_properties: TileProperties

func _run():
	self._load_data()
	var world_editor = self._get_world_editor()
	if world_editor != null:
		#get all Nodes
		var basic_tile = self._create_basic_tile()
		var ground_tile = self._create_ground_tile()
		var socket = self._create_socket()

		#create tile base
		#var tile = Node3D.new()
		#tile.name = "Tile"	
		#world_editor.add_child(tile)
		#tile.owner = get_scene()
		
		#create basic interaction tile
		world_editor.add_child(basic_tile)	
		world_editor.add_child(ground_tile)
		
		basic_tile.owner = get_scene()		
		ground_tile.owner = get_scene()
		
		world_editor.add_child(socket)
		socket.owner = get_scene()

		#test tile
		#var node = Node3D.new()
		#node.name = "TestTile"	
		#world_editor.add_child(node)
		#node.owner = get_scene()
	
func _get_world_editor():
	var world_editor = null
	var all_nodes = self.get_scene().get_children()
	for node in all_nodes:
		if node.name == "EditorTile":
			return node

func _load_data():
	#temp vorest, ggf. auch dem WorldEditor script lesen!!! (Idee dort setzen)
	biome_data = load("res://biomes/biomes_res/forest_birch_0.tres")
	tile_properties = load("res://tiles/tiles_res/forest_pine_snow_campfire.tres")
	basic_tile_scene = load("res://tiles/base/basicTile.tscn")
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")

func _create_basic_tile():
	var basic_tile = basic_tile_scene.instantiate()
	return basic_tile

func _create_ground_tile():
	var ground_tile = ground_tile_scene.instantiate()
	#ground_tile.create_ground_tile(biome_data)
	#var TopLayer = ground_tile.get_node("TopLayer")
	#var material_top = biome_data.ground_material_top
	#TopLayer.set_surface_override_material(0, material_top)
	return ground_tile
	
func _create_socket():
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	return socket

	
