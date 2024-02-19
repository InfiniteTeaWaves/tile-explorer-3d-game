extends Node3D

@onready var camera = $Camera3D

var zoomParameter = {
	"current_size" : 0,
	"z_distance": 200,
	"z_near": 10,
	"z_far": 200,
	"start_size": 30,
	"speed": 5,
	"min": 10,
	"max": 100
}

func _ready():
	self.position.z = zoomParameter["z_distance"]
	camera.size = zoomParameter["start_size"]
	zoomParameter["current_size"] = camera.size

func _unhandled_input(_event):
	self._zoom()
	pass
	
func _zoom():
	var input = {
		"wheel_up": Input.is_action_just_pressed("mousescroll_up"),
		"wheel_down": Input.is_action_just_pressed("mousescroll_down"),
	}
	var zoom = 0
	
	if input["wheel_up"]:
		zoom = -1
	if input["wheel_down"]:
		zoom = 1	
	
	camera.size += zoom * zoomParameter["speed"]
	zoomParameter["current_size"] = camera.size
	
	if camera.size <= zoomParameter["min"]:
		camera.size = zoomParameter["min"]
	if camera.size >= zoomParameter["max"]:
		camera.size = zoomParameter["max"]
	
	
	

