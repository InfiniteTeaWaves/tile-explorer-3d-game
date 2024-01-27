class_name GroundTile extends BasicTile

var top_material: StandardMaterial3D

func _ready():
	pass

func _process(delta):
	pass

func create_ground_tile():
	self._set_top_layer_color()
	 
func _set_top_layer_color():  #ggf hier in tile Creator ziehen
	var TopLayer = $TopLayer
	var material_top = biome_properties.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
