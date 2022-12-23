extends Node2D

var Pause : Resource
var pause : CanvasLayer
var Player : Node2D
var Enemy : Resource
var spawn_cd_dur = 100
var spawn_cd = spawn_cd_dur
var spawn_dir = Vector2(0,-500)

var kill_count = 0
var level = 1
var xp = 0
var xp_needed = 100
var xp_last_level = 0

func _ready():
	print(Singleton.type)
	Singleton.get_type()
	Pause = load("res://Pause/PauseScreen.tscn")
	Enemy = load("res://Enemy/Enemy.tscn")
	Player = get_node("YSort").get_node("Player")

func spawn_enemy():
	var enemy = Enemy.instance()
	spawn_dir = spawn_dir.rotated(deg2rad(24))
	enemy.position = Player.position + spawn_dir
	enemy.target = Player
	get_node("YSort").add_child(enemy)

func _process(_delta):
	level_up()
	spawn_cd-=1
	if spawn_cd <= 0:
		spawn_cd = spawn_cd_dur
		spawn_enemy()

func level_up() -> void:
	if xp-xp_last_level >= xp_needed:
		level+=1
		xp_last_level = xp
		xp_needed *= 1.5

func game_over():
	for child in get_children():
		child.queue_free()
	var _game_over = get_tree().change_scene("res://Character Select/CharacterSelect.tscn")

func _on_Pause_pressed():
	if !get_tree().paused:
		pause = Pause.instance()
		add_child(pause)
	else:
		if Player.hp <= 0:
			game_over()
		pause.queue_free()
	
	get_tree().paused = !get_tree().paused





