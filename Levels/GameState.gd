extends Node2D


var lives = 3
var coins = 0
var target_number_of_coins = 10


func _ready():
	add_to_group("GameState")
	update_gui()

func hurt():
	lives -= 1
	$Player.hurt()
	update_gui()
	
	if lives <= 0:
		end_game()


func update_gui():
	get_tree().call_group("GUI", "update_gui", lives, coins)


func coin_up():
	coins += 1
	update_gui()
	
	var multiple_of_coins = (coins % target_number_of_coins) == 0
	
	if multiple_of_coins:
		life_up()


func life_up():
	lives += 1
	update_gui()


func win_game():
	get_tree().change_scene("res://Levels/WinScreen.tscn")


func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
