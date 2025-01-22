extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2
var placed_count = 0  # Counter for placed objects
var target_count = 6  # Number of objects needed to win


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Dragable.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Dragable.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				var current_scene = get_tree().current_scene.name
				if current_scene == "Arrangebook":
					var game_controller = get_node("/root/Arrangebook")
					game_controller.increment_count()
				elif current_scene == "Bakecake":
					var bake_controller = get_node("/root/Bakecake")
					bake_controller.bake_cake()  # Call the bake cake function
			else:
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)



func _on_Area2D_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.dimgray)
		body_ref = body


func _on_Area2D_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.darkgray)
		body_ref = body


func _on_Area2D_mouse_entered():
	if not Dragable.is_dragging:
		draggable = true
		scale = Vector2(0.30, 0.30)


func _on_Area2D_mouse_exited():
	if not Dragable.is_dragging:
		draggable = false
		scale = Vector2(0.25, 0.25)
