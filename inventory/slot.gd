extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

func set_slot_data(slot_data:SlotData):
	var item_data = slot_data.item_data
	if item_data:
		texture_rect.texture = item_data.texture
		#wieso wird die texture nicht angeyeigt
		tooltip_text = "%s\n%s" % [item_data.game_name, item_data.game_description]
	
		if slot_data.quantity > 1:
			quantity_label.text = "x%s" % slot_data.quantity
			quantity_label.show()
