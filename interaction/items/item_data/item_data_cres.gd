extends Resource
class_name ItemData

@export var name: String
#@export var item_name: String
@export var stackable: bool = true
@export var texture: AtlasTexture
#@export_enum("item","base","artefact") var type: String = "item"

@export_category("Properties")
@export var item_category: String 
@export var sub_category: String

@export_enum("common","uncommon","rare","epic","legendary") var rarity: String = "common"

@export_category("Ingame")
@export var game_name: String
@export var game_description: String
