class_name WorldCreator

var world: Node3D
var world_dynamic: Node3D
var world_editor: Node3D

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

func _init(i_world):
	world = i_world

func create_editor_world(i_world_editor): 
	world_editor = i_world_editor
	for basic_tile in world_editor.get_children():
		self._connect_basic_tile_methods(basic_tile)

func create_dynamic_world(i_world_dynamic, i_2d_tile_map):
	world_dynamic = i_world_dynamic
	var world_array = self.create_map_from_2d_tilemap(i_2d_tile_map)
	
	if world_array:
		for item in world_array:
			var biome_name = item["biome"]
			var biome_properties = BiomeResourceLoader.get_biome_properties(biome_name)
			var biome_data = BiomeResourceLoader.get_biome_data(biome_name)
			if biome_properties and biome_data:
				var basic_tile = TileCreator.new(biome_properties, biome_data).create_tile_from_biome()
				self._add_tile_to_world(item.x * 10 , item.z * 10 , basic_tile)

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
	
func _add_tile_to_world(x, z, basic_tile): 
	#var basic_tile = base_tile.get_node("BasicTile")
	basic_tile.position = Vector3(x, 0, z)  # Set the position
	self._connect_basic_tile_methods(basic_tile)
	world_dynamic.add_child(basic_tile)

func _connect_basic_tile_methods(basic_tile):
	basic_tile.connect("on_click", world._on_BasicTile_clicked)
	basic_tile.connect("on_double_click", world._on_BasicTile_double_clicked)
	basic_tile.connect("on_hover_entry", world._on_BasicTile_hover_entry)
	basic_tile.connect("on_hover_exit", world._on_BasicTile_hover_exit)	
	basic_tile.add_world_signal(world)
