extends Node3D

var rotationSpeed = 0.005

#@export var cameraPlaneAngleY = 0 

func _ready():
	pass 

func _process(delta):
	pass

func _input(event):
	_rotateBase(event)

func _rotateBase(event):
	pass
#	var input = {
#		"mouse_left": Input.is_action_pressed("mouseclick_left"),
#		"mouse_right": Input.is_action_pressed("mouseclick_right"),
#		"wheel_click": Input.is_action_pressed("mousescroll_click")
#	}
#
#	if event is InputEventMouseMotion and input["mouse_right"]:
#		if input["wheel_click"] or input["mouse_left"]:
#			return
#		cameraPlaneAngleY += event.relative.x * rotationSpeed
#		self.rotation.y += event.relative.x * rotationSpeed
 
