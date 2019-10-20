extends Node2D

onready var boardMap = $board_pos
onready var Player = load("res://GridGame/Player_board.tscn")
onready var Player_queue = get_node("Players")
onready var turn_button = get_node("Interface/upper_panel/turnButton")
var countdown = 10
var timer
signal turn_changed
puppet func spawn_player(id):
	var player = Player.instance()
	player.name = String(id) # Important
	player.set_network_master(id) # Important
	Player_queue.add_child(player)
	print("add " + str(player.name))
	$Interface/upper_panel/my_name.set_text(network.my_name)
func _ready():
	turn_button.disabled = true
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
remote func clear_board():
	for i in boardMap.get_used_cells():
		boardMap.set_cell(i[0],i[1],2)	
remote func turn_button_active():
	turn_button.disabled = false
remote func turn_button_swap():
	turn_button.disabled = !turn_button.disabled
func _on_turnButton_pressed():
	emit_signal("turn_changed")
	rpc_id(1,"change_turn")
