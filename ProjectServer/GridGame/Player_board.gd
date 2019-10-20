extends Node2D
sync var isTurn = false
sync var score = 0
var prev_board = []
puppet func turnStart():#Server
	print("server call turn start")
	isTurn = true
	rpc("RPCturnStart")
puppet func turnEnd():#Server
	print("server call turn end")
	isTurn = false
	rpc("RPCturnEnd")
remote func recieved_other_record(other):
	var id = get_tree().get_rpc_sender_id()
	if !prev_board.empty():
		score += compare_board(prev_board,other)
	else:
		prev_board = other
	print("got " + str(other) + " from " + network.player_dict[id])
	print("score " + str(score))
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
	return score