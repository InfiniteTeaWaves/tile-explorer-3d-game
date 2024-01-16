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
	return basic_tile

func _add_ground_tile():
	var ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_biome_data(biome_data)
	ground_tile.create_ground_tile()
	basic_tile.add_child(ground_tile)
	
	
	
	
	
