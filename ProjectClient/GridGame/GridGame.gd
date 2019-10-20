extends Node2D

onready var boardMap = $board_pos
onready var Player = load("res://GridGame/Player_board.tscn")
onready var Player_queue = get_node("Players")
onready var turn_button = get_node("Interface/upper_panel/turnButton")
onready var chat_display = $Interface/bottom_panel/chat_display
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
func _process(delta):
	$Interface/upper_panel/my_score.text = "Score: " + str(network.my_score)
func _ready():
	turn_button.disabled = true
	$Interface/upper_panel/timeText.text = str(countdown)
	timer = Timer.new()
	timer.one_shot = false
	timer.set_wait_time(1.0)
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
func _on_timer_timeout():
	if countdown <= 0:
		if turn_button.disabled == false:
			emit_signal("turn_changed")
			rpc_id(1,"change_turn")
	else:
		countdown -= 1
		$Interface/upper_panel/timeText.text = str(countdown)
sync func start_timer():
	timer.start()
remote func set_countdown(val_board):
	timer.stop()
	if val_board == 0:
		countdown = 10
	elif val_board == 1:
		countdown = 20
	timer.start()
remote func clear_board():
	for i in boardMap.get_used_cells():
		boardMap.set_cell(i[0],i[1],2)	
remote func turn_button_active():
	turn_button.disabled = false
remote func turn_button_swap():
	turn_button.disabled = !turn_button.disabled
remote func display_to_chat(msg):
	chat_display.text += msg + "\n"
func _on_turnButton_pressed():
	emit_signal("turn_changed")
	rpc_id(1,"change_turn")
