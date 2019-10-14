extends Area2D

onready var tex1 = load("res://Asset/d1.png")
onready var tex2 = load("res://Asset/d2.png")
onready var tex3 = load("res://Asset/d4.png")
onready var game = get_tree().get_root().get_node("GridGame")
onready var tex_select = load("res://Asset/d_select.png")
var index = 0
func _ready():
	$Sprite.set_texture(tex3)
	$Select.modulate.a = 0.2
func clear_tex():
	$Sprite.set_texture(tex3)
	index = 0
func get_tex(index):
	match index:
		0:return tex1
		1:return tex2
		2:return tex3
func _on_GridPoint_mouse_entered():
	$Select.set_texture(tex_select)
func _on_GridPoint_mouse_exited():
	$Select.set_texture(null)
func get_current_tex():
	return index
func _on_GridPoint_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("mouse"):
		print(str(index))
		$Sprite.set_texture(get_tex(index))
		index = (index+1)%3
		rpc("update_tex",index)
sync func update_tex(new_index):
	$Sprite.set_texture(get_tex(new_index))