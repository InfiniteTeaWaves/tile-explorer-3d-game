extends Node3D

func _ready():
	pass 

func _process(delta):
	pass

func _on_button_pressed():
	self.get_tree().change_scene_to_file("res://world.tscn")