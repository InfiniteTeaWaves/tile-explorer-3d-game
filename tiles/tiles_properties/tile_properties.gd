extends Resource
class_name TileProperties

#Idee, bei allen Infos wie Lore Guild Action ein State dazugeben

@export var name: String
@export var tile_name: String
@export var biome_properties: BiomeProperties

@export_category("Tile Properties")
@export_enum("normal","locked") var type: String = "normal"
@export var socket_scene: PackedScene
@export_enum("full","frame","water") var socket_type: String = "full"

@export_category("Interaction")
@export_group("Action 1")
@export var action_1: TileAction
@export_enum("unlocked","locked") var state_1: String = "unlocked"
@export var require_1: Array[Requirement]
@export var receive_1: Array[TileItem]

@export_flags("scene:4", "action:8", "lore:16") var lock_1 = 0
@export_group("Action 2")
@export var action_2: TileAction
@export_enum("unlocked","locked") var state_2: String = "unlocked"
@export var require_2: Array[Requirement]
@export var receive_2: Array[TileItem]
@export_flags("scene:4", "action:8", "lore:16") var lock_2 = 0

@export_group("Action 3")
@export var action_3: TileAction
@export_enum("unlocked","locked") var state_3: String = "unlocked"
@export var require_3: Array[Requirement]
@export var receive_3: Array[TileItem]
@export_flags("scene:4", "action:8", "lore:16") var lock_3 = 0

@export_group("Action 4")
@export var action_4: TileAction
@export_enum("unlocked","locked") var state_4: String = "unlocked"
@export var require_4: Array[Requirement]
@export var receive_4: Array[TileItem]
@export_flags("scene:4", "action:8", "lore:16") var lock_4 = 0

@export_group("Further Locks")
#story hint chance ?draw story?
@export var locked_scene: PackedScene
@export var locked_lore: String
#@export var locked_guild: String

#ggf Lore und Guild Übergeben, lore hints ? guild hints?
#@export_category("Lore & guild")
#@export_group("Lore")
#@export_enum("unlocked","locked") var lore_state_1: String = "unlocked"
#@export var lore_1: String
#
#@export_group("Guild")
#@export_enum("unlocked","locked") var guild_state_1: String = "unlocked"
#@export var guild_1: String
