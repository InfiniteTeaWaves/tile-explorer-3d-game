extends Resource
class_name TileAction

@export var name: String
@export var action: String
@export var sub_action: String
@export var icon: Texture
@export_enum("category","sub_category") var type: String = "category"

@export_category("Ingame")
@export var game_name: String
@export var game_description: String
#@export var game_description: String
