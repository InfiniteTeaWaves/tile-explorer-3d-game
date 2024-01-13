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
			biomes[base_name] = load(full_path)
			file_name = dir.get_next()
			
			#biomes[file_name.get_basename()] = 

			#biomes[file_name.get_basename()] = 
		#while file_name != "":
			
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["desert_drylands_0"] = preload("res://cust_resources/biomes/desert_drylands_0.tres".tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	#biomes["city_medieval_0"] = preload("res://cust_resources/biomes/city_medieval_0.tres")
	## Load other biomes similarly

func get_biome_data(biome_name: String) -> BiomeData:
	return biomes[biome_name] if biome_name in biomes else null
