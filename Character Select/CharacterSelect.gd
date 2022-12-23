extends CanvasLayer



func handle_character_select(character: String):
	var selected = character
	Singleton.type = selected
	var _ret = get_tree().change_scene("res://Game/Game.tscn")
