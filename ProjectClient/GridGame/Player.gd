extends Node2D

onready var Player = load("res://GridGame/Player.tscn")
onready var boardMap = get_tree().get_root().get_node("GridGame/board_pos")