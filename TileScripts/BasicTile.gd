#extends Node3D
class_name BasicTileClass extends Node3D

signal on_click(BasicTile)
signal on_double_click(BasicTile)
signal on_hover_entry(BasicTile)
signal on_hover_exit(BasicTile)

var entered_state = false
var clicked_state = false
var base_position_y = self.position.y
var base_position_y_up = self.position.y + 0.3
var base_position_y_clicked = self.position.y + 0.5

@onready var MeshOutline = $MeshTile/MeshOutline
@onready var AnimationOutline = $MeshTile/MeshOutline/AnimationPlayer
@onready var groundTileScene = load("res://groundTile.tscn")

#@export (PackedScene) var testScene

func _ready():
	pass
	
func create_ground_tile(tile_properties: TileProperties):
	var ground_tile_scene = preload("res://GroundTile.tscn")
	var ground_tile = ground_tile_scene.instantiate()
	ground_tile.set_properties(tile_properties)
	self.add_child(ground_tile)

func _process(delta):
	pass
	if entered_state:
		AnimationOutline.play("HoverFade")
	else:
		AnimationOutline.stop()

func _input(event):
	#careful, input triggered for ALL, i need to check weith entereed state
	#state from which arena it comes
	var input = {
		"mouse_left": Input.is_action_pressed("mouseclick_left"),
	}	
	if entered_state: #this way, the specific tile is selected since input triggeres for all
		if input["mouse_left"]:
			_click_on_tile()	
		if event is InputEventMouseButton:
			if event.is_double_click() and event.get_button_index() == 1: #left
				emit_signal("on_double_click", self)
		
func _click_on_tile():
	emit_signal("on_click", self)
	self.position.y = base_position_y_clicked
	clicked_state = true
		
func _on_hover_area_basic_tile_mouse_entered():
	if !clicked_state:
		self.position.y = base_position_y_up
	MeshOutline.show()
	emit_signal("on_hover_entry",self)
	#print("Entered")
	entered_state = true
	

func _on_hover_area_basic_tile_mouse_exited():
	if !clicked_state:
		self.position.y = base_position_y
	MeshOutline.hide()
	emit_signal("on_hover_exit",self)
	#print("Exit")
	entered_state = false
	

func reset_position_y():
	self.position.y = base_position_y
	clicked_state = false
