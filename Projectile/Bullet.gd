extends Node2D

var rad = 10
var move = Vector2(0,0)
var spd = 600

func _ready():
	pass

func _process(delta):
	position += move*delta*spd

func _on_Area2D_area_entered(area):
	if area.name == "Enemy_Area2D":
		area.get_parent().hit()
		queue_free()
