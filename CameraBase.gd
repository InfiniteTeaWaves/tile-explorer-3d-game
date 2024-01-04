extends Node3D

var planeMoveFactor = 8
var rotationSpeed = 0.005
var planeMouseDragSpeed = 0.015

#@onready var cameraYaw = get_node("/root/Root3D/CameraBase/CameraYaw")

#var allInputs = {
#	"up": Input.is_action_pressed("move_up"),
#	"down": Input.is_action_pressed("move_down"),
#	"left": Input.is_action_pressed("move_left"),
#	"right": Input.is_action_pressed("move_right"),	
#	"mouse_left": Input.is_action_pressed("mouseclick_left"),
#	"mouse_right": Input.is_action_pressed("mouseclick_right"),
#	"wheel_up": Input.is_action_pressed("mousescroll_up"),
#	"wheel_down": Input.is_action_pressed("mousescroll_down"),
#	"wheel_click": Input.is_action_pressed("mousescroll_click")
#}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass
#	self.customallControls = allInputs

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_planeMovement(delta)
	
func _input(event):
	_rotateBase(event)
	_mouseMovement(event)
			
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
		
#	var angleY = self.cameraYaw.cameraPlaneAngleY
	movement = movement.rotated(Vector3(0,1,0),self.rotation.y).normalized()	
#	movement = movement.rotated(Vector3(0,1,0),angleY).normalized()
	self.position += movement * delta * planeMoveFactor
	
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
			movement = movement.rotated(Vector3(0,1,0),self.rotation.y)
			self.position += movement * planeMouseDragSpeed


func _rotateBase(event):
	var input = {
		"mouse_left": Input.is_action_pressed("mouseclick_left"),
		"mouse_right": Input.is_action_pressed("mouseclick_right"),
		"wheel_click": Input.is_action_pressed("mousescroll_click")
	}

	if event is InputEventMouseMotion and input["mouse_right"]:
		if input["wheel_click"] or input["mouse_left"]:
			return
		self.rotation.y += event.relative.x * rotationSpeed
		pass
 
