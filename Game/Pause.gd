extends Button

var play = preload("res://Game/Assets/Play_Btn.png")
var pause = preload("res://Game/Assets/Pause_Btn.png")

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS

func _pressed():
	if get_tree().paused:
		set_button_icon(pause)
	else:
		set_button_icon(play)

func draw():
	pass
