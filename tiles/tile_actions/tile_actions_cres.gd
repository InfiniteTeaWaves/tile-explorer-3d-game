extends Resource
class_name TileAction

@export var name: String
#@export var action_name: String
@export var category: String
#@export var texture: Texture

@export_category("Properties")
@export var item_type: String #ggf Items Items Types pflegen oder ENUM
#@export var sub_category: String
#@export var has_subaction: bool
@export var is_subaction: bool
@export var parent_action: TileAction

@export_category("Ingame")
@export var game_name: String
#@export var game_description: String
