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
@export_group("Interaction 1 old")
@export var interaction_1: InteractionData

@export var interactions: Array[InteractionData]

#@export_group("Action 4")
#@export var action_4: ActionData
#@export_enum("unlocked","locked") var state_4: String = "unlocked"
#@export var require_4: Array[RequirementData]
#@export var receive_4: Array[ItemData]
#@export_flags("scene:4", "action:8", "lore:16") var lock_4 = 0

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
