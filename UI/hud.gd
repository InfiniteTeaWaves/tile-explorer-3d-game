extends Control

signal change_global_time(toggled_on: bool)
signal show_interaction_start()
signal show_interaction_main()


@onready var interaction_panel: Panel = $TileInteraction/InteractionPanel
@onready var tile_info_panel: Panel = $TileInfoText/TileInfoPanel
@onready var start_panel: Panel = $TileStart/StartPanel

func _ready():
	pass 

func _process(delta):
	var label_fps = $PanelFPS/FPSLabel
	label_fps.text =  str(Engine.get_frames_per_second()) + " FPS"
	pass

func _input(event):
	_hide_tile_text()

func _hide_tile_text():
	var input = {"esc": Input.is_action_just_pressed("Exit")}
	if input["esc"]:
		if tile_info_panel.visible:
			tile_info_panel.hide()
		if interaction_panel.visible:
			self._show_show_interaction_start()
		#Exit Game	ggf. signal weiter geben (exit game transmitten)

func set_clicked_tile_info_text(tile_properties: TileProperties):
	var info_label = $TileInfoText/TileInfoPanel/TileInfoLabel
	var text = "Tile Data:" + "\n"
	text = text + str(tile_properties.tile_name) + "\n"
	text = text + "\n"
	text = text + "Biome Data:" + "\n"
	text = text + "Name: " +  str(tile_properties.biome_properties.game_name) + "\n"
	text = text + "Type: " +  str(tile_properties.biome_properties.type) + "\n"
	text = text + "Subtype: " +  str(tile_properties.biome_properties.subtype) + "\n"
	info_label.set_text(text)
	tile_info_panel.show()
	
func set_tile_hovered_location_entry(hovered_tile):
	var panel = $TileLocation/TileLocationPanel
	var label = $TileLocation/TileLocationPanel/TileLocationLabel
	label.text = "Position (" + str( hovered_tile.position.x/10 ) + ", " + str( hovered_tile.position.z/10 ) + ")"
	panel.show()	

func set_tile_hovered_location_exit(hovered_tile):
	var panel = $TileLocation/TileLocationPanel
	panel.hide()
	
func _on_check_button_global_time_toggled(toggled_on):
	var time_label = $PanelFPS/TimeLabel
	emit_signal("change_global_time", toggled_on)
	if toggled_on:
		time_label.text = "Night"
	else:
		time_label.text = "Day"

func show_start_panel(tile):
	start_panel.show()
	var tile_name = start_panel.get_node("TileName")
	tile_name.set_text(tile.tile_properties.tile_name)
	
func _on_start_button_pressed():
	emit_signal("show_interaction_main")

func show_interaction_panel(i_biome_properties, i_tile_properties): #hier eigentlich die interaction data entgegenenhmen
	#langfristig hier ein dynamisches Panel mit eigener Scene bauen!!!
	var biome_properties = i_biome_properties
	var tile_properties = i_tile_properties
	
	self._add_button_func_to_interaction(tile_properties)
	start_panel.hide()
	interaction_panel.show()
	#interaction ermitteln
	
func _add_button_func_to_interaction(tile_properties):
	#loopen über array
	if tile_properties.interaction_1:
		var interaction_data = tile_properties.interaction_1
		var button_1 = $TileInteraction/InteractionPanel/ActionButton1
		button_1.text = interaction_data.name
		button_1.pressed.connect(self._interaction_button_pressed.bind(interaction_data, button_1))
		
	#über loop interactions laden, dann button hinzufügen und an anchor hinzfuegne	
   	#for interaction in interactions:
		#var button = Button.new()
		#button.text = interaction.name  # Set button text to the interaction name
		#button.connect("pressed", self, "_handle_interaction", [interaction.type])
		#$InteractionPanel.add_child(button)  # Add the button to your panel	
		
func _interaction_button_pressed(interaction_data, button):
	var interaction = Interaction.new(interaction_data)
	var items = interaction.get_standard_items()
	print(items)
		
func _on_tile_info_close_button_pressed():
	tile_info_panel.hide()

func _on_tile_interaction_close_button_pressed():
	self._show_show_interaction_start()
	
func _show_show_interaction_start():
	interaction_panel.hide()
	start_panel.show()
	emit_signal("show_interaction_start")
