extends Node2D

var move = Vector2(0,0)
var spd = 100
var target : Node2D
var target_dist = 100

func _ready():
	pass

func hit():
	queue_free()

func _process(delta):
	move = (target.position-position).normalized()
	if position.distance_to(target.position) > target_dist:
		position += move*delta*spd
	else:
		hit()
