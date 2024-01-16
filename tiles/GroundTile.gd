class_name GroundTile extends Node3D #Extend BasicTile and use biome_data

var biome_data: BiomeData

func _ready():
	pass

func _process(delta):
	pass

func set_biome_data(data: BiomeData):
	biome_data = data
	
func create_ground_tile():
	_set_top_layer_color()
	
func _set_top_layer_color():
	var TopLayer = $TopLayer
	var material_top = biome_data.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	

