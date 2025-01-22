extends Node2D

var placed_count_ing = 0
var target_count_ing = 3

# Custom mouse cursor for hand
var hand_cursor = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Objects/paw.png")


func _ready():
	pass


func _on_Area2D_mouse_entered():
	Input.set_custom_mouse_cursor(hand_cursor)

func _on_Area2D_mouse_exited():
	Input.set_custom_mouse_cursor(null)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print("imhere")
		$FridgeDoor.visible = false


func _on_CloseDoor_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print("imhere")
		$FridgeDoor.visible = true

func bake_cake():
	placed_count_ing += 1
	print("Placed count: ", placed_count_ing)

	# Check win condition
	if placed_count_ing >= target_count_ing:
		print("You win!")
		_prompt_win()
		WinCond.check_win()

func _prompt_win():
	print("Congratulations! You've won!")
	$Polaroid.visible = true


func _on_Go_Back_pressed():
	get_tree().change_scene(StageManager.MainWorld)
