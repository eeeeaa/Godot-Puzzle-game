extends Node2D

onready var Player = load("res://GridGame/Player.tscn")
onready var Player_queue = get_node("Players")
onready var boardMap = $board_pos
var prev_board = []
var my_record = []
var countdown = 10
var timer
func _ready():
	$Interface/timeText.text = str(countdown)
	timer = Timer.new()
	timer.one_shot = false
	timer.set_wait_time(1.0)
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	timer.start()
func _on_timer_timeout():
	if countdown <= 0:
		timer.stop()
		timer.queue_free()
	else:
		countdown -= 1
		$Interface/timeText.text = str(countdown)
		
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
func get_current_board():
	return my_record
	
func clear_board():
	for i in $board.get_children():
		i.clear_tex()
		
func _on_Button_pressed():
	var current = get_current_board()
	print(current)
	compare_board(prev_board,current)
	prev_board.clear()
func _on_Store_pressed():
	prev_board = get_current_board().duplicate()
	print(prev_board)
func _on_clear_pressed():
	my_record.clear()
	prev_board.clear()
	clear_board()

puppet func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)

func _input(event):
	if Input.is_action_just_pressed("mouse"):
		var selected_mouse_pos = get_viewport().get_mouse_position()
		var selected_tile_pos = boardMap.world_to_map(selected_mouse_pos)
		var current_tile = boardMap.get_cellv(selected_tile_pos)
		if current_tile != -1:
			my_record.append(selected_tile_pos)
