class_name Interaction

var interaction_data: InteractionData
var action: ActionData
var require: Array[RequirementData]
var receive: Array[ItemData]

var used: bool = false
var received_items: Array[ItemData] #später vllt nicht nur items,
#ggf object mit verschiedenen types of items

#ggf bei interaction pflegen wieviele resourcen von welchem dropen können

# Called when the node enters the scene tree for the first time.
func _init(interaction_data_i):
	self.interaction_data = interaction_data_i
	self.action = interaction_data_i.action
	self.require = interaction_data_i.require
	self.receive = interaction_data_i.receive
	
func get_standard_items() -> Array[ItemData]:
	if require:
		print("require logic not implemented for require")
		return Array()
	else:
		#get amount of random items
		var amount: int = 1
		#ggf interaction pflegen
		if self._has_dropped(50): #später alles modifiedn
			amount += 1
		if self._has_dropped(15): #sp'ter alles modifien
			amount += 1	
		return self._get_items(amount)
	
func _has_dropped(drop_chance: float ) -> bool:
	if 0 < drop_chance and drop_chance <= 100:
		return randf() <= drop_chance / 100
	else:
		return false
		print("wrong dropchance for ", interaction_data.name, ". Drop chance must be 0<x<100")
	
func _get_items(number_items: int) -> Array[ItemData]:
	var result_items: Array[ItemData]
	for i in number_items:
		var item_index: int = randi_range(0, receive.size() - 1)
		result_items.append(receive[item_index])
	return result_items
