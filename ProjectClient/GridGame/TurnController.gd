extends Node2D

puppetsync func end_game(name_1,name_2,score_1,score_2):
	network.name_1 = name_1
	network.name_2 = name_2
	network.score_1 = int(score_1)
	network.score_2 = int(score_2)