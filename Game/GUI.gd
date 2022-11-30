extends Node2D

onready var margin = 50
onready var width = OS.get_screen_size().y - margin*2
onready var height = 60

func _process(_delta):
	print(OS.get_screen_size())
	update()
	
func _draw():
	var xp_bgr = Rect2(margin, margin, width, height)
	draw_rect(xp_bgr,Color(0.2,0.2,.2,1),true)
