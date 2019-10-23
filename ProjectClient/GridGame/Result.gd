extends Node2D
onready var score_display_1 = $Result/scoreDisplay/score_1
onready var score_display_2 = $Result/scoreDisplay/score_2
func _ready():
	score_display_1.text = network.name_1 + " : " + str(network.score_1)
	score_display_2.text = network.name_2 + " : " + str(network.score_2)

func _on_restartButton_pressed():
	self.hide()
	network.rpc_id(1, "player_ready",true)
	network.rpc_id(1,"set_who_start",network.score_1,network.score_2)
	rpc("hide_result")
remote func hide_result():
	self.hide()


func _on_quitButton_pressed():
	rpc("quit_game")
sync func quit_game():
	get_tree().quit()
