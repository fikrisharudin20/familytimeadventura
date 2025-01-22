extends Node2D
var placed_count_books = 0
var target_count_books = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func increment_count():
	placed_count_books += 1
	print("Placed count: ", placed_count_books)

	# Check win condition
	if placed_count_books >= target_count_books:
		print("You win!")
		_prompt_win()

func _prompt_win():
	$Photo.visible = true
	WinCond.check_win()

func _on_Back_pressed():
	get_tree().change_scene(StageManager.MainWorld)


func _on_Reload_pressed():
	get_tree().change_scene(StageManager.ArrangeBook)
