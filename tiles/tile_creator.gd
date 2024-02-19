class_name TileCreator

var biome_data: BiomeData
var tile_properties: TileProperties

var basic_tile : BasicTile
var ground_tile: GroundTile

var basic_tile_scene : PackedScene
var ground_tile_scene: PackedScene

func _init(i_biome_data):
	biome_data = i_biome_data
	basic_tile_scene = load("res://tiles/base/basicTile.tscn")
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")

func create_tile_from_biome() -> BasicTile:
	self._get_tile_properties()
	if tile_properties:
		self._create_basic_tile()
		self._add_ground_tile();
		self._add_tile_properties();
	return basic_tile

func _create_basic_tile():
	basic_tile = basic_tile_scene.instantiate()
	basic_tile.set_data(tile_properties)

func _add_ground_tile():
	ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_data(tile_properties)
	ground_tile.create_ground_tile()
	basic_tile.add_child(ground_tile)
	
func _get_tile_properties():
	var tiles = biome_data.tile_properties
	if tiles and tiles.size() > 0:
		var random_index = randi() % tiles.size()
		tile_properties = biome_data.tile_properties[random_index]	
	
func _add_tile_properties():
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	basic_tile.add_child(socket)

	
	
	
	
