@tool
extends EditorScript

var basic_tile: BasicTile
var ground_tile: GroundTile
var socket: Node3D

var ground_tile_scene: PackedScene
var socket_scene: PackedScene
var gem_scene: PackedScene

var tile_properties: TileProperties

func _run():
	basic_tile = self._get_world_editor()
	if basic_tile != null:	
		self._get_nodes()
		self._set_properties()
		self._create_ground_tile()	
		self._create_socket()	
		
		basic_tile.add_child(ground_tile)
		ground_tile.owner = self.get_scene()
		basic_tile.add_child(socket)
		socket.owner = self.get_scene()
		
		ground_tile.get_node("TopLayer")
		
	else:
		print("Basic tile not found")

func _get_world_editor():
	var all_nodes = self.get_scene().get_children()
	for node in all_nodes:
		if node.name == "WorldEditor":
			var tile = node.get_node("BasicTile")
			return tile

func _get_nodes():
	ground_tile_scene = load("res://tiles/base/groundTile.tscn")
	ground_tile = ground_tile_scene.instantiate()
	
func _set_properties():
	#basic_tile
	tile_properties = basic_tile.tile_properties	
	basic_tile.name = tile_properties.name
			
	#ground_tile
	ground_tile.tile_properties = tile_properties	

func _create_ground_tile():
	var TopLayer = ground_tile.get_node("TopLayer")
	var material_top = tile_properties.biome_properties.ground_material_top
	TopLayer.set_surface_override_material(0, material_top)
	
func _create_socket():
	socket_scene = tile_properties.socket_scene
	socket = socket_scene.instantiate()
	socket.name = "Socket" + tile_properties.Socket
	print("socket found")
	
