extends CanvasLayer

const MainMenu = "res://MainMenu.tscn"
const MainWorld = "res://World.tscn"
const WashCar = "res://Washcar.tscn"
const ArrangeBook = "res://Arrangebook.tscn"
const BakeCake = "res://Bakecake.tscn"
const End = "res://End.tscn"

func change_stage(stage_path):
	get_node("ColorRect").show()
	var old_layer = layer
	layer = 5
	get_node("anim").play("Fade In")
	yield(get_node("anim"), "animation_finished")
	
	get_tree().change_scene(stage_path)
	layer = old_layer
	get_node("anim").play("Fade Out")
