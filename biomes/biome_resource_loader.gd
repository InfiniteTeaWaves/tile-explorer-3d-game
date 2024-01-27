extends Node

#var access: DirAccess
var biome_data = {}
var biome_properties = {}
var biome_properties_folder_path = "res://biomes/biome_properties"
var biome_data_folder_path = "res://biomes/biome_data"

#iin resource loader
func _ready():
	self._load_resources(biome_properties_folder_path, biome_properties)
	self._load_resources(biome_data_folder_path, biome_data)
	
func _load_resources(path, array):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var base_name = file_name.get_basename()
			var full_path: String = path + "/" + file_name
			array[base_name] = load(full_path) #asynchronoous doesnt work dynamically
			file_name = dir.get_next()

func get_biome_properties(biome_name: String) -> BiomeProperties:
	return biome_properties[biome_name] if biome_name in biome_properties else null
	
func get_biome_data(biome_name: String) -> BiomeData:
	return biome_data[biome_name] if biome_name in biome_data else null
