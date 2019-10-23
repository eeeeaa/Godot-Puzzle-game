extends Node2D

remote func restart_game(score_1,score_2):
	if score_1 >= score_2:
		pass
	elif score_2 < score_1:
		pass
sync func quit_game():
	get_tree().quit()
