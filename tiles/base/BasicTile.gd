#extends Node3D
class_name BasicTile extends Node3D

signal on_click(BasicTile)
signal on_double_click(BasicTile)
signal on_hover_entry(BasicTile)
signal on_hover_exit(BasicTile)

@export var biome_properties: BiomeProperties
@export var tile_properties: TileProperties

var tile_locked_mode: bool = false

var entered_state = false
var clicked_state = false
var base_position_y = self.position.y
var base_position_y_up = self.position.y + 0.3
var base_position_y_clicked = self.position.y + 0.5

@onready var MeshOutline = $MeshTile/MeshOutline
@onready var AnimationOutline = $MeshTile/MeshOutline/AnimationPlayer

func _ready():
	MeshOutline.hide()
	pass

func set_data(i_biome_properties, i_tile_properties):
	biome_properties = i_biome_properties
	tile_properties = i_tile_properties

func _process(delta):
	pass
	if entered_state:
		AnimationOutline.play("HoverFade")
	else:
		AnimationOutline.stop()

func _input(event):
	#careful, input triggered for ALL, i need to check weith entereed state
	var input = {"mouse_left": Input.is_action_just_released("mouseclick_left", true)}	
	if entered_state: #this way, the specific tile is selected since input triggeres for all
		if input["mouse_left"]:
			self._click_on_tile()	
		if event is InputEventMouseButton:
			if event.is_double_click() and event.get_button_index() == 1: #left
				self._double_click_on_tile()

func _click_on_tile():
	emit_signal("on_click", self)
	if tile_locked_mode:
		return
	self.position.y = base_position_y_clicked
	clicked_state = true		
	
func _double_click_on_tile():
	if tile_locked_mode:
		return
	emit_signal("on_double_click", self)
		
func _on_hover_area_basic_tile_mouse_entered():
	if !clicked_state:
		self.position.y = base_position_y_up
	MeshOutline.show()
	emit_signal("on_hover_entry",self)
	entered_state = true
	
func _on_hover_area_basic_tile_mouse_exited():
	if !clicked_state:
		self.position.y = base_position_y
	MeshOutline.hide()
	emit_signal("on_hover_exit",self)
	entered_state = false
	
func reset_tile():
	self.position.y = base_position_y
	clicked_state = false

func add_world_signal(world: Node3D):
	world.connect("tile_locked", self._tile_locked)	

func _tile_locked(locked: bool):
	tile_locked_mode = locked
