extends Panel

onready var chat_display = $chat_display
onready var chat_input = $chat_input
	
func _input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ENTER:
            send_message()

func send_message():
	var msg = chat_input.text
	chat_input.text = ""
	#var id = get_tree().get_network_unique_id()
	var nickname = network.my_name
	rpc("receive_message", nickname, msg)

sync func receive_message(nickname, msg):
	var final_text = (str(nickname) + ": " + msg + "\n")
	chat_display.text += final_text