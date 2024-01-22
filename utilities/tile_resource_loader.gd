extends Node

#ggf nicht notwendig

var tiles = {}
var access: DirAccess
var tile_folder_path = "res://cust_resources/tiles";

#iin resource loader
func _ready():
	var dir = DirAccess.open(tile_folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var base_name = file_name.get_basename()
			var full_path: String = tile_folder_path + "/" + file_name
			tiles[base_name] = load(full_path) #asynchronoous doesnt work dynamically
			file_name = dir.get_next()

func get_tile_properties(tile_name: String) -> TileProperties:
	return tiles[tile_name] if tile_name in tiles else null
