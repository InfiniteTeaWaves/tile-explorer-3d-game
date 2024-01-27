@tool
extends EditorScript

var base_tile: BaseTile
var basic_tile: BasicTile
var ground_tile: GroundTile
var socket: Node3D

var base_tile_scene: PackedScene
var socket_scene: PackedScene
var gem_scene: PackedScene

var biome_properties: BiomeProperties
var tile_properties: TileProperties

func _run():
	base_tile = self._get_world_editor()
	if base_tile != null:	
		self._get_nodes()
		self._set_properties()
		self._create_ground_tile()	
		self._create_socket()	
		
		base_tile.add_child(socket)
		socket.owner = get_scene()

func _get_world_editor():
	var world_editor = null
	var all_nodes = self.get_scene().get_children()
	for node in all_nodes:
		if node.name == "WorldEditor":
			var tile = node.get_node("BaseTile")
			return tile

func _set_properties():
	biome_properties = base_tile.biome_properties
	tile_properties = base_tile.tile_properties	
	
	#base_tile
	base_tile.name = tile_properties.name
	
	#basic_tile
	basic_tile.biome_properties = biome_properties
	basic_tile.tile_properties = tile_properties	
		
	#ground_tile
	ground_tile.biome_properties = biome_properties
	ground_tile.tile_properties = tile_properties	

func _get_nodes():
	basic_tile = base_tile.get_node("BasicTile")
	ground_tile = base_tile.get_node("BasicTile/GroundTile")	

func _create_ground_tile():
	var TopLayer = ground_tile.get_node("TopLayer")
	var material_top = biome_properties.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	
func _create_socket():
	socket_scene = tile_properties.socket_scene
	socket = socket_scene.instantiate()
	socket.name = "Socket" + tile_properties.Socket

	
