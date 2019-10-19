extends Node2D
sync var isTurn = false
sync var score = 0

func turnStart():#Server
	isTurn = true
	rpc("RPCturnStart")
func turnEnd():#Server
	isTurn = false
	rpc("RPCturnEnd")
func update_score(score):
	rset("score",score)
	