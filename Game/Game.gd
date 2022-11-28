extends Node2D

var Player : Node2D
var spawn_cd_dur = 20
var spawn_cd = spawn_cd_dur
var spawn_dir = Vector2(0,-500)

func _ready():
	Player = get_node("Player")

func spawn_enemy():
	var Enemy = load("res://Enemy/Enemy.tscn")
	var enemy = Enemy.instance()
	spawn_dir = spawn_dir.rotated(deg2rad(12))
	enemy.position = Player.position + spawn_dir
	enemy.target = Player
	get_parent().add_child(enemy)

func _process(_delta):
	spawn_cd-=1
	if spawn_cd <= 0:
		spawn_cd = spawn_cd_dur
		spawn_enemy()
