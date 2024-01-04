extends Node3D

var zoomParameter = {
	"min": 0.5,
	"max": 2,
	"default": 1.25,
	"speed": 1,
	"position": 4
}
#var currentZoomState = ""
#var zoomStates = {
#	"close": {
#		"angle": -30,
#		"distance": 1		
#	},
#	"middle": {
#		"angle": -40,
#		"distance": 2		
#	},
#	"far": {
#		"angle": -50,
#		"distance": 3		
#	},		
#}
#var zoomStatesOrder = ["close","middle","far"]

func _ready():
	self.position.z = zoomParameter["position"] * zoomParameter["default"]
#	self.rotation.x = deg_to_rad(zoomParameter["angle"])
#	self.rotation.x = deg_to_rad(zoomStates["middle"]["angle"])
#	self.currentZoomState = zoomStates["middle"]

func _process(delta):
	pass

func _unhandled_input(event):
	var input = {
		"wheel_up": Input.is_action_pressed("mousescroll_up"),
		"wheel_down": Input.is_action_pressed("mousescroll_down"),
	}
	var zoom = 0
	
	if input["wheel_up"]:
		zoom = -1
	if input["wheel_down"]:
		zoom = 1	
		
	self.position.z += zoom * zoomParameter["speed"]
	
	if self.position.z <= zoomParameter["position"] * zoomParameter["min"]:
		self.position.z = zoomParameter["position"] * zoomParameter["min"]
	if self.position.z >= zoomParameter["position"] * zoomParameter["max"]:
		self.position.z = zoomParameter["position"] * zoomParameter["max"]

