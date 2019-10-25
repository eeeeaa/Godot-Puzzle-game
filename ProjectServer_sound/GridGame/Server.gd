extends Node2D

onready var server_status = $server_status
onready var player_display = $player_display

func update_player_display():
	player_display.text = ""
	var players = network.player_dict
	for i in players.keys():
		player_display.text += str(i) + ":" + str(players[i]) + "\n"
	