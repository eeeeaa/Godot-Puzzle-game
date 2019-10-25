extends Area2D

onready var tex_select = load("res://Asset/d_select.png")
#var player=AudioStreamPlayer.new()

func _ready():
	$Select.modulate.a = 0.2

func _on_GridPoint_mouse_entered():
	$Select.set_texture(tex_select)
	

func _on_GridPoint_mouse_exited():
	$Select.set_texture(null)
	

func _on_GridPoint_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("Play Click")
			$sound51.play()
			#self.add_child(player)
			#player.stream=load("res://sound6.wav")
			#player.play()
