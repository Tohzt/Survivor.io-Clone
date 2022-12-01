extends Node2D

onready var anim = $AnimatedSprite

var hp_max = 10
var hp = hp_max
var is_alive = true
var move = Vector2(0,0)
var spd = 100
var target : Node2D
var target_dist = 100

func _ready():
	pass

func hit():
	if is_alive:
		hp-=10
		if hp <= 0:
			is_alive = false
			get_tree().get_root().get_child(0).kill_count += 1
			move = Vector2.ZERO
			spd = 0
			anim.speed_scale = 1
			anim.speed_scale = 3
			anim.animation = "Death"

func drop_xp() -> void:
	var loot = load("res://Loot/Loot.tscn")
	var xp = loot.instance()
	xp.position = position
	get_parent().add_child(xp)

func _process(delta):
	if is_alive:
		move = (target.position-position).normalized()
		
		if position.distance_to(target.position) > target_dist:
			anim.speed_scale = 5
			anim.animation = "Move"
			position += move*delta*spd
		else:
			anim.speed_scale = 1
			anim.animation = "Idle"
			pass#hit()
	else:
		if anim.frame == 7:
			drop_xp()
			queue_free()
