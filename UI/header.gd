extends Node2D

var player 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#init hier setzen

func set_player(i_player):
	player = i_player
	player.connect("update_header", self._update_header_moved)
	


func _update_header_moved(i_rounds, i_distance):
	var round_label = $RoundLabel
	var distance_label = $DistanceLabel
	round_label.text = "Rounds " + str(i_rounds)
	distance_label.text = "Distance " + str(i_distance)
