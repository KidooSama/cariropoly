extends Node2D

var position_index = 0
var current_tile = null
var money = 500
var player_id = 0
var skip_turns = 0

@export var move_speed = 200

func setup(id, start_tile):
	player_id = id
	current_tile = start_tile
	global_position = start_tile.global_position

func move(steps):
	position_index += steps
	current_tile = get_parent().get_node("Board").get_tile(position_index)
	global_position = current_tile.global_position
	current_tile.on_player_enter(self)
