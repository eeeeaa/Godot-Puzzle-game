extends Node2D
onready var score_display_1 = $Result/scoreDisplay/score_1
onready var score_display_2 = $Result/scoreDisplay/score_2
func _ready():
	score_display_1.text = network.name_1 + " : " + str(network.score_1)
	score_display_2.text = network.name_2 + " : " + str(network.score_2)