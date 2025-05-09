extends Area2D

enum TileType { NORMAL, SORTE, AZAR, PRISAO }

@export var tile_type: TileType = TileType.NORMAL
@export var price: int = 100
var tile_owner = null

func on_player_enter(player):
	match tile_type:
		TileType.NORMAL:
			if tile_owner == null and player.money >= price:
				player.money -= price
				tile_owner = player
			elif tile_owner != null and tile_owner != player:
				player.money -= 20  # aluguel simples
		TileType.SORTE:
			player.money += 50
		TileType.AZAR:
			player.money -= 50
		TileType.PRISAO:
			player.skip_turns = 1
