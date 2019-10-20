extends Node2D
sync var isTurn = false
sync var score = 0
onready var game = get_tree().get_root().get_node("GridGame")
puppet func turnStart():#Server
	print("server call turn start")
	isTurn = true
	rpc("RPCturnStart")
puppet func turnEnd():#Server
	print("server call turn end")
	isTurn = false
	rpc("RPCturnEnd")
remote func set_my_score(score):
	network.player_score[get_tree().get_rpc_sender_id()] = score
remote func recieved_other_record(other):
	var id = get_tree().get_rpc_sender_id()
	if !network.prev_board.empty():
		score = compare_board(network.prev_board,other)
		rpc_id(id,"update_score",score)
		print("stored board(Defend): " + str(network.prev_board))
		network.prev_board.clear()
		network.end_round = true
	else:
		network.prev_board = other
		print("stored board(Attack): " + str(network.prev_board))
	print("got " + str(other) + " from " + network.player_dict[id])
	print("score " + str(score))
func compare_board(board_a:Array,board_b:Array):
	var score = 0
	var length = min(board_a.size(),board_b.size())
	if length == 0:
		return 0
	for i in range(length):
		if board_a[i][0] == board_b[i][0] and board_a[i][1] == board_b[i][1]:
			score+=1
	if board_a.size() == board_b.size() and score == board_a.size():
		print("true")
	else:
		print("false")
	return score