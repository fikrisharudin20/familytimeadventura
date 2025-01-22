extends Node2D


# State of the button
var is_button_toggled = false
var count = 0
var target_count = 6

# Custom mouse cursor for hand
var hand_cursor = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Objects/paw.png")

# Called when the node enters the scene tree for the first time
func _ready():
	pass
# Change to hand cursor when mouse enters Area2D
func _on_Area2D_mouse_entered():
	Input.set_custom_mouse_cursor(hand_cursor)  # Change to hand cursor when mouse enters

# Revert cursor back to default when mouse exits Area2D
func _on_Area2D_mouse_exited():
	Input.set_custom_mouse_cursor(null)  # Revert to default cursor

# Handle button state toggle
func _on_Button_toggled(button_pressed: bool):
	is_button_toggled = button_pressed  # Update the button toggle state   
	print("Toggle Button State:", is_button_toggled)

# Handle input event for Area2D sprites
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite.visible = false  # Hide sprite when button is clicked
		count += 1
		check()

func _on_Area2D2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite2.visible = false  # Hide sprite 2 when button is clicked
		count += 1
		check()

func _on_Area2D3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite3.visible = false  # Hide sprite 3 when button is clicked
		count += 1
		check()

func _on_Area2D4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite4.visible = false  # Hide sprite 4 when button is clicked
		count += 1
		check()

func _on_Area2D5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite5.visible = false  # Hide sprite 5 when button is clicked
		count += 1
		check()

func _on_Area2D6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_button_toggled:
		$Sprite6.visible = false  # Hide sprite 6 when button is clicked
		count += 1
		check()

func check():
	print("Placed count: ", count)

	# Check win condition
	if count >= target_count:
		print("You win!")
		_prompt_win()
		WinCond.check_win()

func _prompt_win():
	print("Congratulations! You've won!")
	$Polaroid.visible = true

func _on_Back_pressed():
	get_tree().change_scene(StageManager.MainWorld)
