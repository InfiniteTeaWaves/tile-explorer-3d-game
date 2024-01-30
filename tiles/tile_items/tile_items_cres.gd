extends Resource
class_name TileItem

@export var name: String
#@export var item_name: String
@export var texture: Texture

@export_category("Properties")
@export var item_type: String #ENUM oder über Resource
@export var sub_type: String
#@export var lore: String
#@export var actions: Array[Resource]
#@export var biome: BiomeProperties
@export_enum("common","uncommon","rare","epic","legendary") var rarity: String = "common"

@export_category("Ingame")
@export var game_name: String
@export var game_description: String
