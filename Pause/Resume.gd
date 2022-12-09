extends Button


func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS

func play_or_restart():
	var Game = get_parent().get_parent()
	Game._on_Pause_pressed()
