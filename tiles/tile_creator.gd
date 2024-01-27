class_name TileCreator

var biome_properties: BiomeProperties
var biome_data: BiomeData
var tile_properties: TileProperties

var base_tile: BaseTile
var basic_tile : BasicTile
var ground_tile: GroundTile

var base_tile_scene: PackedScene
var basic_tile_scene : PackedScene
var ground_tile_scene: PackedScene

func _init(i_biome_properties, i_biome_data):
	biome_properties = i_biome_properties
	biome_data = i_biome_data
	base_tile_scene = load("res://tiles/base/baseTile.tscn")
	basic_tile_scene = load("res://tiles/base/basicTile.tscn")
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")

func create_tile_from_biome():
	self._get_tile_properties()
	if tile_properties:
		self._create_base_tile()
		self._create_basic_tile()
		self._add_ground_tile();
		self._add_tile_properties();
	return base_tile #for events

func _create_base_tile():
	base_tile = base_tile_scene.instantiate()
	base_tile.biome_properties = biome_properties
	base_tile.tile_properties = tile_properties

func _create_basic_tile():
	basic_tile = base_tile.get_node("BasicTile")
	#basic_tile = basic_tile_scene.instantiate()
	basic_tile.biome_properties = biome_properties
	basic_tile.tile_properties = tile_properties
	#base_tile.add_child(basic_tile)

func _add_ground_tile():
	#ground_tile = ground_tile_scene.instantiate()
	#ground_tile.biome_properties = biome_properties
	#ground_tile.tile_properties = tile_properties
	##ground_tile.set_biome_data(biome_data)
	#basic_tile.add_child(ground_tile)
	ground_tile = base_tile.get_node("BasicTile/GroundTile")
	ground_tile.biome_properties = biome_properties
	ground_tile.tile_properties = tile_properties
	ground_tile.create_ground_tile()
	
func _get_tile_properties():
	var tiles = biome_data.tile_properties
	if tiles and tiles.size() > 0:
		var random_index = randi() % tiles.size()
		tile_properties = biome_data.tile_properties[random_index]	
	
func _add_tile_properties(): #erstmal Test ob geladen wird
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	basic_tile.add_child(socket)
	#var tile_socket_art = TileResourceLoader.get_tile_properties(tile_properties); #aktuell nicht dynamisch
	#tile loader ggf. nicht notwendig

	
	
	
	
