extends Node3D

var zoomParameter = {
	"min": 0.75,
	"max": 2.25,
	"default": 1.25,
	"speed": 0.8,
	"position": 8,
	"zoomFactor": 1 
}

func _ready():
	self.position.z = zoomParameter["position"] * zoomParameter["default"]
	zoomParameter["currentZoom"] = zoomParameter["default"]

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
	zoomParameter["currentZoom"] = self.position.z / zoomParameter["position"]
	
	if zoomParameter["currentZoom"] <= zoomParameter["min"]:
		self.position.z = zoomParameter["position"] * zoomParameter["min"]
	if zoomParameter["currentZoom"] >= zoomParameter["max"]:
		self.position.z = zoomParameter["position"] * zoomParameter["max"]

