extends Node2D

onready var boardMap = get_tree().get_root().get_node("GridGame").get_node("board_pos")
onready var game = get_tree().get_root().get_node("GridGame")
var my_record = []
var is_me = false
func _ready():
	game.connect("turn_changed",self,"_on_turn_changed")
remote func RPCturnStart():#Client
	is_me = true
	print(str(network.my_name) + " got called start")
remote func RPCturnEnd():#Client
	is_me = false
	print(str(network.my_name) + " got called end")
remote func _update_grid(selected_tile_pos,selected_tile_index):
	boardMap.set_cellv(selected_tile_pos,selected_tile_index)
func _on_turn_changed():
	rpc("recieved_other_record",my_record)
func _input(event):
	if is_network_master():
		if is_me == true:
			if Input.is_action_just_pressed("mouse"):
				var selected_mouse_pos = get_global_mouse_position()
				var selected_tile_pos = boardMap.world_to_map(selected_mouse_pos)
				var tile_used = boardMap.get_used_cells()
				var current_tile = boardMap.get_cellv(selected_tile_pos)
				if(current_tile != -1):
					var selected_tile_index = (current_tile + 1)%3
					boardMap.set_cellv(selected_tile_pos,selected_tile_index)
					my_record.append(selected_tile_pos)
					rpc("_update_grid",selected_tile_pos,selected_tile_index)