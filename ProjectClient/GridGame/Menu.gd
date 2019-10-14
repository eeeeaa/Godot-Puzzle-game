extends Node2D


func _ready():
	network.connect("connection_failed", self, "_on_connection_failed")
	network.connect("connection_succeeded", self, "_on_connection_success")
	network.connect("server_disconnected", self, "_on_server_disconnect")
	network.connect("players_updated", self, "update_players_list")

func _on_JoinButton_pressed():
	network.my_name = $CanvasLayer/nameEdit.text
	network.connect_to_server()


func _on_connection_success():
	#status.text = "Connected"
	#status.modulate = Color.green
	$CanvasLayer/JoinButton.hide()
	$CanvasLayer/nameEdit.hide()
	$CanvasLayer/Panel.show()


func _on_connection_failed():
	#status.text = "Connection Failed, trying again"
	#status.modulate = Color.red
	$CanvasLayer/Panel.hide()


func _on_server_disconnect():
	#status.text = "Server Disconnected, trying to connect..."
	#status.modulate = Color.red
	$CanvasLayer/Panel.hide()


func update_players_list():
	$CanvasLayer/Panel/player_list.text = String(network.get_player_list())


func _on_readyButton_pressed():
	# Tell server we are ready to join the game
	$CanvasLayer/Panel.hide()
	$CanvasLayer/Panel/readyButton.disabled = true
	network.rpc_id(1, "player_ready")
