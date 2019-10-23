extends Node

# Default game port
const DEFAULT_PORT = 5000

# Max number of players
const MAX_PLAYERS = 2

# Players dict stored as id:name
onready var server_status = get_tree().get_root().get_node("Server").get_node("server_status")
onready var server = get_tree().get_root().get_node("Server")
var player_dict = {}
var player_score = {}
var ready_players = []
var seq = 0
sync var prev_board = []
sync var end_round = false
sync var who_start = 0
signal post_game_finished
signal post_game_restart_finished
func display_msg(msg):
	server_status.text += str(msg) +"\n"
func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self,"_player_disconnected")
	
	create_server()

func create_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(host)
func _player_connected(id):
	print(str(id) + " connected")
	display_msg(str(id) + " connected")
func _player_disconnected(id):
	print(str(id) + " disconnected")
	display_msg(str(id) + " disconnected")
remote func register_player(new_player_name):
	# We get id this way instead of as parameter, to prevent users from pretending to be other users
	var caller_id = get_tree().get_rpc_sender_id()
	
	# If game is going, just ignore new guy
	if not has_node("/root/GridGame"):
		# Add him to our list
		player_dict[caller_id] = new_player_name
		# Add everyone to new player:
		for p_id in player_dict:
			rpc_id(caller_id, "register_player", p_id, player_dict[p_id]) # Send each player to new dude
		
		rpc("register_player", caller_id, player_dict[caller_id]) # Send new dude to all players
		# NOTE: this means new player's register gets called twice, but fine as same info sent both times
		
		print("Client ", caller_id, " registered as ", new_player_name)
		display_msg("Client " + str(caller_id) + " registered as " + str(new_player_name))
		server.update_player_display()
puppetsync func unregister_player(id):
	player_dict.erase(id)
	
	print("Client ", id, " was unregistered")
	display_msg("Client " + str(id) + " was unregistered")
	server.update_player_display()
remote func player_ready(is_restart):
	var caller_id = get_tree().get_rpc_sender_id()
	
	if not ready_players.has(caller_id):
		ready_players.append(caller_id)
		
	if ready_players.size() == player_dict.size():
		if ready_players.size() >= 2:
			if is_restart == false:
				pre_start_game()
			else:
				pre_restart_game()
func pre_start_game():
	var world = load("res://GridGame/GridGame.tscn").instance()
	get_tree().get_root().add_child(world)
	for id in player_dict:
		get_node("/root/GridGame").spawn_player(id)
	rpc("pre_start_game")
remote func post_start_game():
	var caller_id = get_tree().get_rpc_sender_id()
	var world = get_node("/root/GridGame")
	for player in world.get_node("Players").get_children():
		world.rpc_id(caller_id, "spawn_player", player.get_network_master())
	emit_signal("post_game_finished")
remote func post_restart_game():
	var caller_id = get_tree().get_rpc_sender_id()
	var world = get_node("/root/GridGame")
	for player in world.get_node("Players").get_children():
		world.rpc_id(caller_id, "spawn_player", player.get_network_master())
	emit_signal("post_game_restart_finished")	
func end_game():
	var world = get_tree().get_root().get_node("GridGame")
	var result = load("res://GridGame/Result.tscn").instance()
	rpc("end_game")
	get_tree().get_root().remove_child(world)
	get_tree().get_root().add_child(result)
func pre_restart_game():
	var world = load("res://GridGame/GridGame.tscn").instance()
	get_tree().get_root().add_child(world)
	for id in player_dict:
		get_node("/root/GridGame").spawn_player(id)
	rpc("pre_restart_game")
remote func set_who_first(score_1,score_2):
	if score_1 >= score_2:
		who_start = 0
	else:
		who_start = 1