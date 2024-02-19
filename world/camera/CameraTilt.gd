extends Node3D

var tiltSpeed = 0.00125
var max_tilt = -75
var min_tilt = -15

func _ready():
	self.rotation.x = deg_to_rad(-35) #Starting Angle
	pass 

func _input(event):
	_tiltBase(event)

func _tiltBase(event):
	pass
	var input = {
		"mouse_left": Input.is_action_pressed("mouseclick_left"),
		"mouse_right": Input.is_action_pressed("mouseclick_right"),
		"wheel_click": Input.is_action_pressed("mousescroll_click")
	}

	if event is InputEventMouseMotion and input["mouse_right"]:
		if input["wheel_click"] or input["mouse_left"]:
			return
		self.rotation.x += -event.relative.y * tiltSpeed
		
		if self.rotation.x <= deg_to_rad(max_tilt):
			self.rotation.x = deg_to_rad(max_tilt)
			return
		if self.rotation.x >= deg_to_rad(min_tilt): 
			self.rotation.x = deg_to_rad(min_tilt)
			return
