extends StaticBody2D

var current_items = []  # To track the items in the container
var max_items = 1  # The maximum number of items the container can hold (adjust as needed)

func _ready():
	modulate = Color(Color.darkgray)


func _process(delta):
	if Dragable.is_dragging:
		visible = true
	else:
		visible = false

