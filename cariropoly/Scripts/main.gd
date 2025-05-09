extends Node2D

var players = []
var current_turn = 0
var dice_result = 0

@onready var board = $Board
@onready var ui = $UI

func _ready():
	players = [$Player1, $Player2]
	for i in range(players.size()):
		players[i].setup(i + 1, board.get_start_tile())
	update_ui()

func roll_dice():
	dice_result = randi() % 6 + 1
	ui.update_dice_label(dice_result)
	var current_player = players[current_turn]
	current_player.move(dice_result)

func end_turn():
	current_turn = (current_turn + 1) % players.size()
	update_ui()

func update_ui():
	ui.update_turn_label("Vez do Jogador %d" % (current_turn + 1))
	ui.update_money_labels(players)
