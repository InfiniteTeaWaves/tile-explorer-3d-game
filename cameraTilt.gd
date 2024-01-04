extends Node3D

var tiltSpeed = 0.005

func _ready():
	self.rotation.x = deg_to_rad(-45)
	pass 

func _process(delta):
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
		self.rotation.x += event.relative.y * tiltSpeed
		
		if self.rotation.x <= deg_to_rad(-75):
			self.rotation.x = deg_to_rad(-75)
			return
		if self.rotation.x >= deg_to_rad(-15): 
			self.rotation.x = deg_to_rad(-15)
			return
