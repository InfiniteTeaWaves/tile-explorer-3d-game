extends Node

var biomes = {}
var access: DirAccess
var biome_folder_path = "res://cust_resources/biomes";

#iin resource loader
func _ready():
	var dir = DirAccess.open(biome_folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var base_name = file_name.get_basename()
			var full_path: String = biome_folder_path + "/" + file_name
			biomes[base_name] = load(full_path) #asynchronoous doesnt work dynamically
			file_name = dir.get_next()

func get_biome_data(biome_name: String) -> BiomeData:
	return biomes[biome_name] if biome_name in biomes else null
