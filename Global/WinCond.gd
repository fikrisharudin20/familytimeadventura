extends Node

var win_counter = 0
var win_cond = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func check_win():
	win_counter += 1
	print("win counter ", win_counter)

	# Check win condition
	if win_counter >= win_cond:
		print("You win the game, the family is happy!")
		_prompt_win()

func _prompt_win():
	get_tree().change_scene(StageManager.End)
	
