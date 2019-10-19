extends Node2D
sync var isTurn = false
sync var score = 0
puppet func turnStart():#Server
	print("server turn start")
	isTurn = true
	rpc("RPCturnStart")
puppet func turnEnd():#Server
	print("server turn end")
	isTurn = false
	rpc("RPCturnEnd")
remote func recieved_other_record(other):
	var id = get_tree().get_rpc_sender_id()
	print("got " + str(other) + " from " + network.player_dict[id])