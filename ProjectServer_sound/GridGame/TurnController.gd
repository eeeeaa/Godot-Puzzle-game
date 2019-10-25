extends Node

var active_player_index = 0
var round_count = 0
func get_active_player():
	return get_child(active_player_index)
func get_active_player_index():
	return active_player_index
func start_turn():
	get_child(active_player_index).turnStart()
func change_turn():
	print("round " + str(round_count))
	get_child(active_player_index).turnEnd()
	round_count += 1
	end_game()
	active_player_index = (active_player_index + 1)%get_child_count()
	get_child(active_player_index).turnStart()
func update_score(score):#####
	get_child(active_player_index).update_score(score)
func end_game():
	if round_count >= 4:#end game
		var name_1 = network.player_dict[int(get_child(0).name)]
		var name_2 = network.player_dict[int(get_child(1).name)]
		var score_1 = network.player_score[int(get_child(0).name)]
		var score_2 = network.player_score[int(get_child(1).name)]
		rpc("end_game",name_1,name_2,score_1,score_2)
		network.end_game()