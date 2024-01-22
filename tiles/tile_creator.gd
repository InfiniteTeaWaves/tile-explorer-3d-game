class_name TileCreator

var biome_data: BiomeData #BiomeProperties?

var basic_tile : BasicTile
var basic_tile_scene : PackedScene
var ground_tile_scene: PackedScene

func _init(data):
	biome_data = data
	basic_tile_scene = load("res://tiles/basicTile.tscn")
	ground_tile_scene = load("res://tiles/groundTile.tscn")

func create_tile_from_biome_data():
	basic_tile = basic_tile_scene.instantiate()
	basic_tile.set_biome_data(biome_data)
	_add_ground_tile();
	_add_tile_properties();
	return basic_tile

func _add_ground_tile():
	var ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_biome_data(biome_data)
	ground_tile.create_ground_tile()
	basic_tile.add_child(ground_tile)
	
func _add_tile_properties(): #erstmal Test ob geladen wird
	var tiles = biome_data.tile_properties
	if tiles.size() > 0:
		var random_index = randi() % tiles.size()
		var tile_properties = biome_data.tile_properties[random_index]
		var socket_scene = tile_properties.socket_scene
		var socket = socket_scene.instantiate()
		basic_tile.add_child(socket)
		#var tile_socket_art = TileResourceLoader.get_tile_properties(tile_properties); #aktuell nicht dynamisch
		#tile loader ggf. nicht notwendig

	
	
	
	
