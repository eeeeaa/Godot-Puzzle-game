extends Node

var active_player_index = 0
func get_active_player():
	return get_child(active_player_index)
func get_active_player_index():
	return active_player_index
func start_turn():
	get_child(active_player_index).turnStart()
func change_turn():
	get_child(active_player_index).turnEnd()
	active_player_index = (active_player_index + 1)%get_child_count()
	get_child(active_player_index).turnStart()
func update_score(score):#####
	get_child(active_player_index).update_score(score)