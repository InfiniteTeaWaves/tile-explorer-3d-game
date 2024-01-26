class_name GroundTile extends Node3D #Extend BasicTile and use biome_data

var biome_data: BiomeData
var top_material: StandardMaterial3D

func _ready():
	pass

func _process(delta):
	pass

#func set_biome_data(data: BiomeData):
	#biome_data = data

#sollte von außen erzeugt werden? nicht hier in script
func create_ground_tile(i_biome_data):
	biome_data = i_biome_data
	self._set_top_layer_color()
	
#sollte von außen erzeugt werden? nicht hier in script
func _set_top_layer_color():
	var TopLayer = $TopLayer
	var material_top = biome_data.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	
