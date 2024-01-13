extends Node
class_name WorldCreator

var tile_biome_mapping = {
	1: "city_medieval_0", 
	2: "desert_drylands_0",  
	3: "desert_dune_0",  
	4: "desert_red_0",  
	5: "forest_birch_0",  
	6: "forest_pine_0",  
	7: "forest_snow_0",  
	8: "lake_shallow_0",  
	9: "mountain_high_0",  
	10: "ocean_dark_0",  
	11: "steppe_ice_0",  
	12: "swamp_mire_0",  
}

func _ready():
	pass 

func _process(delta):
	pass

func create_map_from_2d_tilemap(tile_map):
	var world_array = []
	var tile_set = tile_map.tile_set
	
	for cell in tile_map.get_used_cells(0):	
		var atlas_coords = Vector2i(cell.x,cell.y)
		var tile_data = tile_map.get_cell_tile_data(0,atlas_coords)
		var source_id = tile_map.get_cell_source_id(0,atlas_coords)
		
		var biome_name = tile_biome_mapping[source_id]
		var scaled_x = cell.x
		var scaled_z = cell.y 
		world_array.append({"x": scaled_x, "z": scaled_z, "biome": biome_name})
	return world_array
