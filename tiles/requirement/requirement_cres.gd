extends Resource
class_name Requirement

@export var requirement_name: String
@export var icon: Texture

@export var item_category: String
@export var item_subcategory: String
@export var lore: String
@export var guild: String
@export var item: TileItem

@export_enum("common","uncommon","rare","epic","legendary") var rarity: String = "common"
@export_flags("category:2", "subcategory:4", "lore:8", "lore:16", "guild:32", "specific:64") var lock_1 = 0

@export_category("Ingame")
@export var game_name: String
@export var game_description: String


