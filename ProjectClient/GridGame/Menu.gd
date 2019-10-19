extends Node2D
onready var status = $CanvasLayer/lobby/bottom_panel/chat_display
func _ready():
	network.connect("connection_failed", self, "_on_connection_failed")
	network.connect("connection_succeeded", self, "_on_connection_success")
	network.connect("server_disconnected", self, "_on_server_disconnect")
	network.connect("players_updated", self, "update_players_list")

func _on_JoinButton_pressed():
	network.my_name = $CanvasLayer/nameEdit.text
	network.connect_to_server()


func _on_connection_success():
	status.text += "Connected\n"
	$CanvasLayer/JoinButton.hide()
	$CanvasLayer/nameEdit.hide()
	$CanvasLayer/lobby.show()
	$CanvasLayer/lobby.fade_in()


func _on_connection_failed():
	status.text += "Connection Failed, trying again\n"
	$CanvasLayer/lobby.fade_out()
	yield($CanvasLayer/lobby,"fade_finished")
	$CanvasLayer/lobby.hide()


func _on_server_disconnect():
	status.text += "Server Disconnected, trying to connect...\n"
	$CanvasLayer/lobby.fade_out()
	yield($CanvasLayer/lobby,"fade_finished")
	$CanvasLayer/lobby.hide()


func update_players_list():
	$CanvasLayer/lobby/Panel/player_list.text = ""
	var player_list = network.get_player_list()
	for i in player_list:
		$CanvasLayer/lobby/Panel/player_list.text += str(i) + "\n"

func _on_readyButton_pressed():
	# Tell server we are ready to join the game
	$CanvasLayer/lobby.fade_out()
	yield($CanvasLayer/lobby,"fade_finished")
	$CanvasLayer/lobby.hide()
	$CanvasLayer/lobby/Panel/readyButton.disabled = true
	network.rpc_id(1, "player_ready")


