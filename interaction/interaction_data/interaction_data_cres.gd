extends Resource
class_name InteractionData

@export var name: String
@export var game_name: String

@export_category("Interaction")
@export var action: ActionData
@export var require: Array[RequirementData]
@export var receive: Array[ItemData]

@export_category("Optional")
@export_enum("unlocked","locked") var state: String = "unlocked"

var used: bool = false
