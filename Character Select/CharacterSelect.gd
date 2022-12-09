extends CanvasLayer



func handle_character_select(character: String):
	var selected = character
	print(selected)
	var _ret = get_tree().change_scene("res://Game/Game.tscn")
