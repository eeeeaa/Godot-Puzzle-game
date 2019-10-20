extends Node2D
onready var Player = load("res://GridGame/Player_board.tscn")
onready var Player_queue = get_node("Players")
var one_shot = false
func _ready():
	network.connect("post_game_finished",self,"_on_post_finished")
func _on_post_finished():
	#starting the first round
	if one_shot == false:#make sure it runs only one time
		#randomize first player
		var random_start = randi()%100-1
		if(random_start%2 == 0):
			Player_queue.active_player_index = 0
			rpc_id(int(Player_queue.get_child(0).name),"turn_button_active")
		else:
			Player_queue.active_player_index = 1
			rpc_id(int(Player_queue.get_child(1).name),"turn_button_active")
		Player_queue.start_turn()
		rpc("set_countdown",10)
		rpc("start_timer")
		one_shot = true
func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)

remote func change_turn():
	#only change turn if recieved command from the active player
	print("server change turn")
	if int(Player_queue.get_child(Player_queue.get_active_player_index()).name) == get_tree().get_rpc_sender_id():
		if network.end_round != true:
			rpc("clear_board")
			rpc("turn_button_swap")
			rpc("display_to_chat","changing turn")
			if network.prev_board.empty():
				network.prev_board = [-1]
				rpc("set_countdown",0)
			else:
				rpc("set_countdown",1)
			Player_queue.change_turn()
		else:
			_on_switch_attacker()
		
func _on_switch_attacker():
	print("switch attacking side")
	rpc("clear_board")
	rpc("display_to_chat","switch attacking side!")
	if network.prev_board.empty():
			rpc("set_countdown",0)
	else:
		 	rpc("set_countdown",1)
	network.end_round = false



