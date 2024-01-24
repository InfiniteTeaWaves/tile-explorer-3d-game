@tool
extends Node3D

var basic_tile
var ground_tile

@export var basic_tile_scene: PackedScene
@export var ground_tile_scene: PackedScene
@export var biome_data: BiomeData 

#ToDo
#Eine neue Node unter TileBase hÄngen, an die dann basic Tile hängen
#groundTile wird noch nicht verwendet bzw. muss noch korrekt hinzugefügt werden
#irgednwie war set_biome_data ein Problem
#add Child funktionert hier noch nicht ricthig

#Ground

@export var tile_properties: TileProperties:
	set(p_tile_properties):
		if ( p_tile_properties != tile_properties):
			tile_properties = p_tile_properties
			
			# WORKING Test
			#var node = Node3D.new()
			#node.name = tile_properties.name
			#self.add_child(node)
			#node.owner = get_tree().edited_scene_root
					
			self._create_tile() #read
			#This can be put into the tile creator editor, 
			#it just returns the basic tile and adds it to the scene
			#this coding can be put into the worldEditorNode!
				

func _create_tile():
	basic_tile = self._create_basic_tile()
	ground_tile = self._create_ground_tile()
	basic_tile.add_child(ground_tile)	
	
	#add to editor scene
	self.add_child(basic_tile)
	#groundTile fehlt noch und muss hinzugefügt werden
	basic_tile.name = tile_properties.name
	#statt self hier
	basic_tile.owner = self.get_tree().edited_scene_root

func _create_basic_tile():
	basic_tile = basic_tile_scene.instantiate()
	self._add_tile_properties()
	return basic_tile
	
func _add_tile_properties():
	var socket_scene = tile_properties.socket_scene
	var socket = socket_scene.instantiate()
	basic_tile.add_child(socket)

func _create_ground_tile():
	ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_biome_data(biome_data)
	ground_tile.create_ground_tile()
	return ground_tile
