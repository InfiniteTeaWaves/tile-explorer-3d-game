extends Node3D

var yawSpeed =  0.00125
var cameraPlaneAngleY

func _ready():
	self.rotation.y = deg_to_rad(160) #Starting Position Y Rotation
	cameraPlaneAngleY = self.rotation.y 
	pass 

func _process(_delta):
	#self.rotation.z = deg_to_rad(-45)
	pass

func _input(event):
	_rotateBase(event)

func _rotateBase(event):
	pass
	var input = {
		"mouse_left": Input.is_action_pressed("mouseclick_left"),
		"mouse_right": Input.is_action_pressed("mouseclick_right"),
		"wheel_click": Input.is_action_pressed("mousescroll_click")
	}

	if event is InputEventMouseMotion and input["mouse_right"]:
		if input["wheel_click"] or input["mouse_left"]:
			return
		cameraPlaneAngleY += -event.relative.x * yawSpeed
		self.rotation.y = cameraPlaneAngleY
 
