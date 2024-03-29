class_name GroundTile extends BasicTile

var top_material: StandardMaterial3D

func _ready():
	#biome_properties need to be set when the GroundTile is created
	# such that the top layer can be changed when the tile starts
	#otherwise, the default material is used
	self._set_top_layer_color()

func set_data(_i_tile_properties):
	tile_properties = _i_tile_properties

func create_ground_tile():
	self._set_top_layer_color()
	 
func _set_top_layer_color():  #ggf hier in tile creator ziehen
	var TopLayer = $TopLayer
	var material_top = tile_properties.biome_properties.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
