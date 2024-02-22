extends Control

var item_data: ItemData
var slot_data: SlotData
var entered: bool = false

#Timer function hierhin verschieben?

@onready var slot = $IconPanel/Slot
@onready var name_label = $TextPanel/NameLabel
@onready var description_label = $TextPanel/DescriptionLabel

func _input(_event):
	var input = {"right": Input.is_action_just_pressed("mouseclick_right")}
	if entered and input["right"]:
		self._remove_item_data()
		
func show_item_data(item_data_i):	
	item_data = item_data_i
	
	#da schon vorhanden ,nicht notwendig zu tree hinzuzufügen
	slot_data =  SlotData.new()
	slot_data.item_data = item_data
	
	slot.set_slot_data(slot_data)
	
	name_label.text = item_data.game_name
	description_label.text = item_data.game_description

func _remove_item_data():
	self.hide() #is destroyed after timer.
	#optionally, a signal can be emmited for destruction or just wait for 2 seconds

func _on_info_mouse_entered():
	entered = true

func _on_info_mouse_exited():
	entered = false
