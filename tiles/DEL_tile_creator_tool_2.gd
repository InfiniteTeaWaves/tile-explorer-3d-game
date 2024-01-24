@tool
extends EditorScript

var basic_tile : BasicTile
var ground_tile: GroundTile
var basic_tile_scene : PackedScene
var ground_tile_scene: PackedScene

var biome_data: BiomeData #BiomeProperties?
var tile_properties: TileProperties
var parent

func _run():
	#self._load_data()

	#Test from Godot
	var parent = self.get_scene().get_node("World3D")
	print(parent)
	var node = Node3D.new()
	parent.add_child(node)
	node.owner = get_scene()
	
	#var node = Node3D.new()
	#parent.add_child(node)
	#node.owner = get_scene()
	#print(parent, node, node.owner)
	
	#parent.add_child(node)
	#basic_tile = self._create_basic_tile()
	#ground_tile = self._create_ground_tile()
	#basic_tile.add_child(ground_tile)
	#basic_tile.owner = get_scene()

func _load_data():
	tile_properties = load("res://tiles/tiles_res/forest_pine_snow_campfire.tres")
	basic_tile_scene = load("res://tiles/base/basicTile.tscn")
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")

func _create_basic_tile():
	basic_tile = basic_tile_scene.instantiate()
	basic_tile.set_biome_data(biome_data)
	_add_tile_properties();
	return basic_tile

func _create_ground_tile():
	ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_biome_data(biome_data)
	ground_tile.create_ground_tile()
	return ground_tile
	
func _add_tile_properties(): #erstmal Test ob geladen wird
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	basic_tile.add_child(socket)

	
