extends Node2D

onready var boardMap = get_tree().get_root().get_node("GridGame").get_node("board_pos")
var my_record = []
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
remote func RPCturnStart():#Client
	print(str(network.my_name) + " got called start")
remote func RPCturnEnd():#Client
	print(str(network.my_name) + " got called end")
func _input(event):
	if Input.is_action_just_pressed("mouse"):
		var selected_mouse_pos = get_global_mouse_position()
		var selected_tile_pos = boardMap.world_to_map(selected_mouse_pos)
		var tile_used = boardMap.get_used_cells()
		var current_tile = boardMap.get_cellv(selected_tile_pos)
		if(current_tile != -1):
			var selected_tile_index = (current_tile + 1)%3
			boardMap.set_cellv(selected_tile_pos,selected_tile_index)
			rpc("_update_grid", selected_tile_pos,selected_tile_index)
func update_score(score):
	rset("score",score)
remote func _update_grid(selected_tile_pos,selected_tile_index):
	boardMap.set_cellv(selected_tile_pos,selected_tile_index)
