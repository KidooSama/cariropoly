extends CanvasLayer

@onready var turn_label = $TurnLabel
@onready var dice_label = $DiceLabel
@onready var money_label = $MoneyLabel
@onready var roll_button = $RollButton

func _ready():
	roll_button.pressed.connect(_on_roll_pressed)

func _on_roll_pressed():
	get_parent().roll_dice()
	await get_tree().create_timer(1).timeout
	get_parent().end_turn()

func update_turn_label(text):
	turn_label.text = text

func update_dice_label(number):
	dice_label.text = "Dado: %d" % number

func update_money_labels(players):
	var text = ""
	for i in range(players.size()):
		text += "Jogador %d: R$ %d\n" % [i + 1, players[i].money]
	money_label.text = text
