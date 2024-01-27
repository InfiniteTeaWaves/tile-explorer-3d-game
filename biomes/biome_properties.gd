extends Resource
class_name BiomeProperties

@export var biome_name: String
@export var game_name: String
@export var type: String
@export var subtype: String

@export_subgroup("ground properties")
@export var ground_material_top: StandardMaterial3D

@export_subgroup("additional")
@export var lore: String
@export var guild: Array[String]

@export_subgroup("graphical effects")
@export var weather: BiomeWeater 
@export_enum("dawn","noon","dusk","night") var time: String = "noon"

#@export var is_start: bool
#@export_flags("tower", "village", "plain", "forest") var tile_type = 0
#enum TimeSelection {dawn,noon,dusk,night}

# Define an enum for the time selections
