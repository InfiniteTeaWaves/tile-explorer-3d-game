extends PanelContainer

const Slot = preload("res://inventory/slot.tscn")
@onready var item_grid = $MarginContainer/ItemGrid

var inv_data

func _ready():
	inv_data = preload("res://inventory/inventory_data/player_inventory.tres")
	populate_item_grid(inv_data.slot_datas)

func populate_item_grid(slot_datas: Array[SlotData]):
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot_data in slot_datas:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		
		if slot_data:
			slot.set_slot_data(slot_data)

func add_item(item_data): #EIGENE function!
	var item_added = false
	for inv_slot_data in inv_data.slot_datas:
		if inv_slot_data and inv_slot_data.item_data.name == item_data.name:
			inv_slot_data.quantity += 1
			item_added = true
			break
	if !item_added:
		var new_slot_data =  SlotData.new()
		new_slot_data.item_data = item_data
		var index = inv_data.slot_datas.find(null,0)
		inv_data.slot_datas[index] = new_slot_data
	populate_item_grid(inv_data.slot_datas)	
