class_name GroundTile extends Node3D #Extend BasicTile and use biome_data

var biome_data: BiomeData
#var color: Color #Alt

func _ready():
	pass

func _process(delta):
	pass

#func set_properties(tile_properties: TileProperties):
	#var TopLayer2 = $TopLayer
	#color = tile_properties.color
	#
	## Get the current override material or create a new one if it doesn't exist
	#var	material = StandardMaterial3D.new()  # Or StandardMaterial3D.new() for Godot 4.0
	#material.albedo_color = color
	#TopLayer2.set_surface_override_material(0, material)

func set_biome_data(data: BiomeData):
	biome_data = data
	
func create_ground_tile():
	_set_top_layer_color()
	
func _set_top_layer_color():
	var TopLayer = $TopLayer
	var material_top = biome_data.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	

