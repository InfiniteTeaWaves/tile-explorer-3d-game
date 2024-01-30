extends Resource
class_name TileProperties

@export var name: String
@export var tile_name: String
@export var biome_properties: BiomeProperties

#erstmal Gem und Socket verwerfen?

@export_category("Tile Properties")
@export_enum("small","large","full") var Socket: String = "full"
@export var socket_scene: PackedScene
@export_enum("none","small","large") var Gem: String = "none"
@export var gem_scene: PackedScene

#Lock scene und after lock hier pflegen (kuppel freischalten)
#ggf angeben generell locked, oder welche Action die locked condition is, und welche dann
#unlocked

@export_group("Items and Actions")
@export var action_1: TileAction
@export var resource_1: TileItem
@export var action_2: TileAction
@export var resource_2: TileItem
@export var action_3: TileAction
@export var resource_3: TileItem
@export var action_4: TileAction
@export var resource_4: TileItem

#func get_ground_color() -> Color:
	#return biome.ground_color if biome else Color(0, 0, 0)
#
#func create_tile(tile_data: TileData):
	#var new_tile = Node.new() # Or use a more specific type if needed
#
	## Set the ground color (assuming you have a method or node to apply this)
	#new_tile.set_ground_color(tile_data.get_ground_color())
#
	## Instantiate and add the socket scene if it exists
	#if tile_data.socket_scene:
		#var socket_instance = tile_data.socket_scene.instance()
		#new_tile.add_child(socket_instance)
#
	## Instantiate and add the gem scene if it exists
	#if tile_data.gem_scene:
		#var gem_instance = tile_data.gem_scene.instance()
		#new_tile.add_child(gem_instance)
#
	#return new_tile

