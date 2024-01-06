class_name TileProperties

var color: Color
var some_other_property  # Add more properties as needed

func _init(_color: Color, _other_property):
	color = _color
	some_other_property = _other_property

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
