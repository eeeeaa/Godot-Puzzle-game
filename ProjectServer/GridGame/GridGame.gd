extends Node2D
onready var Player = load("res://GridGame/Player_board.tscn")
onready var Player_queue = get_node("Players")
var one_shot = false
func _ready():
	network.connect("post_game_finished",self,"_on_post_finished")
func _on_post_finished():
	if one_shot == false:
		var random_start = randi()%100-1
		if(random_start%2 == 0):
			Player_queue.active_player_index = 0
		else:
			Player_queue.active_player_index = 1
		Player_queue.start_turn()
		one_shot = true
func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)

remote func change_turn():
	Player_queue.change_turn()
	
func compare_board(board_a:Array,board_b:Array):
	var score = 0
	var length = min(board_a.size(),board_b.size())
	for i in range(length):
		if board_a[i] == board_b[i]:
			score+=1
	if board_a.size() == board_b.size() and score == board_a.size():
		print("true")
	else:
		print("false")


