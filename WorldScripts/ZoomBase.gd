extends Node3D

@onready var camera = $Camera3D

var zoomParameter = {
	"z_near": 10,
	"z_far": 200,
	"min": 0.75,
	"max": 10,
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
	var size = 0
	
	if input["wheel_up"]:
		zoom = -1
	if input["wheel_down"]:
		zoom = 1	
		
	self.position.z += zoom * zoomParameter["speed"]
	size = zoom * zoomParameter["speed"]
	#camera.set_orthogonal(size, zoomParameter["z_near"], zoomParameter["z_far"])
	zoomParameter["currentZoom"] = self.position.z / zoomParameter["position"]
	
	if zoomParameter["currentZoom"] <= zoomParameter["min"]:
		self.position.z = zoomParameter["position"] * zoomParameter["min"]
		#size = zoomParameter["position"] * zoomParameter["min"]
		#camera.set_orthogonal(size, zoomParameter["z_near"], zoomParameter["z_far"])
		#camera.orthogonal= zoomParameter["position"] * zoomParameter["min"]
	if zoomParameter["currentZoom"] >= zoomParameter["max"]:
		self.position.z = zoomParameter["position"] * zoomParameter["min"]
		#size = zoomParameter["position"] * zoomParameter["min"]
		#camera.set_orthogonal(size, zoomParameter["z_near"], zoomParameter["z_far"])
	
	

