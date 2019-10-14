extends Node

const ADDRESS = "127.0.0.1"
const PORT = 5000

signal connection_failed
signal connection_succeeded
signal server_disconnected
signal players_updated

var my_name = "Client"
var player_dict = {}#Stored as id:name
func _ready():
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func connect_to_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ADDRESS, PORT)
	get_tree().set_network_peer(host)
	
func _connected_ok():
	emit_signal("connection_succeeded")
	# Register ourselves with the server
	rpc_id(1, "register_player", my_name)
	
func _connected_fail():
	player_dict.clear()
	emit_signal("server_disconnected")
	
func _server_disconnected():
	get_tree().set_network_peer(null) # Remove peer
	emit_signal("connection_failed")
	
puppet func register_player(id, new_player_data):
	player_dict[id] = new_player_data
	emit_signal("players_updated")


puppet func unregister_player(id):
	player_dict.erase(id)
	emit_signal("players_updated")

# Returns list of player names
func get_player_list():
	return player_dict.values()
	
puppet func pre_start_game():
	get_node("/root/Menu").hide()
	var world = load("res://GridGame/GridGame.tscn").instance()
	get_tree().get_root().add_child(world)
	rpc_id(1, "post_start_game")
	