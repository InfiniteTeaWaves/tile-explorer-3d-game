extends Control

#connect events direclty to HUD?
signal change_global_time(toggled_on: bool)

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
		var panel = $TileText/TileTextPanel
		if panel.visible:
			self._hide_panel()
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
	
func _on_button_pressed():
	self._hide_panel()

func _hide_panel():
	var panel = $TileText/TileTextPanel
	panel.hide()		
	
func _on_check_button_global_time_toggled(toggled_on):
	var time_label = $PanelFPS/TimeLabel
	emit_signal("change_global_time", toggled_on)
	if toggled_on:
		time_label.text = "Night"
	else:
		time_label.text = "Day"
