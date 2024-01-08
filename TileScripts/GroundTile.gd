#extends BasicTileClass
extends Node3D

var color: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_properties(tile_properties: TileProperties):
	var TopLayer = $TopLayer
	color = tile_properties.color
	
	# Get the current override material or create a new one if it doesn't exist
	var	material = StandardMaterial3D.new()  # Or StandardMaterial3D.new() for Godot 4.0
	material.albedo_color = color
	TopLayer.set_surface_override_material(0, material)
