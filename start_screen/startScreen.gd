extends Node3D

func _ready():
	pass 

func _process(delta):
	pass
	
func _input(event):
	var input = {
		"enter": Input.is_action_just_pressed("enter"),
		"space": Input.is_action_just_pressed("space")
	}
	if input["enter"] or input["space"]:
		self._start_game()
	
func _on_button_pressed():
	self._start_game()

func _start_game():
	self.get_tree().change_scene_to_file("res://world.tscn")
