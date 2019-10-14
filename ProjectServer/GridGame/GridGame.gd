extends Node2D

onready var Player = load("res://GridGame/Player.tscn")
onready var Player_queue = get_node("Players")

func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)