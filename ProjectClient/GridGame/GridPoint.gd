extends Area2D

onready var tex_select = load("res://Asset/d_select.png")
func _ready():
	$Select.modulate.a = 0.2

func _on_GridPoint_mouse_entered():
	$Select.set_texture(tex_select)
func _on_GridPoint_mouse_exited():
	$Select.set_texture(null)
