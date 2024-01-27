extends Control

#connect events direclty to Hud?

func _ready():
	pass 

func _process(delta):
	pass

func _input(event):
	_hide_tile_text()

func _hide_tile_text():
	var input = {"esc": Input.is_action_just_pressed("Exit")}
	if input["esc"]:
		var panel = $TileText/TileTextPanel
		if panel.visible:
			panel.hide()	
		else:
			pass 
			#Exit Game	ggf. signal weiter geben (exit game transmitten)

func set_clicked_tile_text(biome_properties: BiomeProperties):
	var panel = $TileText/TileTextPanel
	var label = $TileText/TileTextPanel/TileTextLabel
	label.text = str(biome_properties.game_name)
	panel.show()
	
func set_tile_hovered_text_entry(hovered_tile):
	var panel = $TileInfo/TileInfoPanel
	var label = $TileInfo/TileInfoPanel/TileInfoLabel
	label.text = "Tile (" + str( hovered_tile.position.x/10 ) + ", " + str( hovered_tile.position.z/10 ) + ")"
	panel.show()	

func set_tile_hovered_text_exit(hovered_tile):
	var panel = $TileInfo/TileInfoPanel
	panel.hide()
	
func hide_panel_after_button_close():
	var panel = $TileText/TileTextPanel
	panel.hide()	
