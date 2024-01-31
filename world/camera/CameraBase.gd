extends Node3D

var tile_locked_mode: bool = false

@export var planeMoveFactor = 0.5
@export var planeMouseDragSpeed = 0.001

@onready var world = self.get_parent()
@onready var cameraYaw = $CameraYaw
@onready var zoomBase = $CameraYaw/CameraTilt/ZoomBase
#get_node("/root/World3D/CameraBase/CameraYaw")

func _ready():
	world.connect("tile_locked", self._set_tile_locked)
	pass

func _process(delta):
	if tile_locked_mode:
		return
	self._planeMovement(delta)
	
func _input(event):
	if tile_locked_mode:
		return
	self._mouseMovement(event)
			
func _planeMovement(delta):
	var input = {
		"up": Input.is_action_pressed("move_up"),
		"down": Input.is_action_pressed("move_down"),
		"left": Input.is_action_pressed("move_left"),
		"right": Input.is_action_pressed("move_right"),	
	}
	
	var movement = Vector3()
	
	if (input["up"] and input["down"]) or (input["left"] and input["right"]):
		return
	if input["up"]:
		movement.z = -1
	if input["down"]:
		movement.z = 1
	if input["left"]:
		movement.x = -1
	if input["right"]:
		movement.x = 1
		
#	movement = movement.rotated(Vector3(0,1,0),self.rotation.y).normalized()	
	var yawAngle = cameraYaw.cameraPlaneAngleY
	movement = movement.rotated(Vector3(0,1,0),yawAngle).normalized()
	
	self.position += movement * delta * planeMoveFactor * zoomBase.zoomParameter["current_size"]
	
func _mouseMovement(event):
	var input = {
		"mouse_left": Input.is_action_pressed("mouseclick_left"),
		"wheel_click": Input.is_action_pressed("mousescroll_click")
	}
	
	if event is InputEventMouseMotion:
		if input["mouse_left"] or input["wheel_click"]:
			var movement = Vector3()
			
			movement.x = -event.relative.x		
			movement.z = -event.relative.y	
			
			var yawAngle = cameraYaw.cameraPlaneAngleY
			movement = movement.rotated(Vector3(0,1,0),yawAngle)
			self.position += movement * planeMouseDragSpeed * zoomBase.zoomParameter["current_size"]

func set_position_to_clicked_tile(clicked_tile):
	self.position.x = clicked_tile.position.x
	self.position.z = clicked_tile.position.z

func _set_tile_locked(locked: bool):
	tile_locked_mode = locked
