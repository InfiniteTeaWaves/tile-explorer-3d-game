@tool
extends EditorScript

var base_tile: BaseTile
var basic_tile: BasicTile
var ground_tile: GroundTile

var socket: Node3D

var base_tile_scene: PackedScene
var socket_scene: PackedScene
var gem_scene: PackedScene

var biome_data: BiomeData #BiomeProperties? without tileData?
var tile_properties: TileProperties

func _run():
	base_tile = self._get_world_editor()
	print("Base Tile: ", base_tile)
	if base_tile != null:	
		
		biome_data = base_tile.biome_data 
		tile_properties = base_tile.tile_properties
		print("biome data", biome_data)
		print("tile properties",tile_properties)
		
		base_tile.name = tile_properties.name
		
		basic_tile = base_tile.get_node("BasicTile")
		print("basic_tile ", basic_tile)
		
		
		ground_tile = base_tile.get_node("BasicTile/GroundTile")	
		print("ground_tile ", ground_tile)
		#ground_tile.create_ground_tile(biome_data) funktioniert nicht
		self._create_ground_tile()
		print("ground tile method success")
		
		self._create_socket()
		print("socket ", socket)		
		
		base_tile.add_child(socket)
		socket.owner = get_scene()
		#base_tile.owner = get_scene()

func _get_world_editor():
	var world_editor = null
	var all_nodes = self.get_scene().get_children()
	for node in all_nodes:
		print(node.name)
		if node.name == "WorldEditor":
			print("WorldEditor: ", node)
			var tile = node.get_node("BaseTile")
			print("base tile: ", tile)
			return tile

func _create_ground_tile():
	print("fetching TOpLayer")
	var TopLayer = ground_tile.get_node("TopLayer")
	print("topLayer", TopLayer)
	var material_top = biome_data.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	#name of groundTile
	
func _create_socket():
	socket_scene = tile_properties.socket_scene
	socket = socket_scene.instantiate()

	
