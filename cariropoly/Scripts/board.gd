extends Node2D

var tiles = []

func _ready():
	tiles = get_children()

func get_tile(index):
	return tiles[index % tiles.size()]

func get_start_tile():
	return get_tile(0)
