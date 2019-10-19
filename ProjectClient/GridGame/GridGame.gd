extends Node2D

onready var boardMap = $board_pos
onready var Player = load("res://GridGame/Player_board.tscn")
onready var Player_queue = get_node("Players")
var countdown = 10
var timer
puppet func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)
	print("add " + str(player.name))
	$Interface/upper_panel/my_name.set_text(network.my_name)
func _ready():
	$Interface/upper_panel/timeText.text = str(countdown)
	timer = Timer.new()
	timer.one_shot = false
	timer.set_wait_time(1.0)
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	timer.start()	
func _on_timer_timeout():
	if countdown <= 0:
		countdown = 10
	else:
		countdown -= 1
		$Interface/upper_panel/timeText.text = str(countdown)

func clear_board():
	pass
		
func _on_turnButton_pressed():
	rpc_id(1,"change_turn")
