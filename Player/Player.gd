class_name Player
extends Node2D

var velocity = Vector2.ZERO
var speed = 0

onready var states = $state_manager
onready var animations = $anim_manager
onready var anim = $AnimatedSprite
var target_dir = Vector2(0,-1)

func _ready() -> void:
	states.init(self)
	animations.init(self)

func _on_input(move, dodge):
	states.input(move.normalized(), dodge)

func _process(delta):
	position += velocity * delta * speed





#var move_speed = 300
#var roll_speed = 700
#var roll_dur_limit = 40
#var roll_dur = roll_dur_limit
#var movement : Vector2 = Vector2(0,0)
#
#var atk_dur_limit = 20
#var atk_dur = atk_dur_limit
#var atk_cd_default = 100
#var atk_cd = atk_cd_default
#var target_dir = Vector2(0,-1)
#
#enum STATES {IDLE, MOVE, DODGE, ATTACK}
#var State = STATES.IDLE
#
#onready var anim = $AnimatedSprite
#var anim_cur = "IDLE"
#var anim_dir = 0
#var anim_len = 2
#var anim_frame = 0
#var anim_cd_dur = 5
#var anim_cd = anim_cd_dur
#
#var pressed = false
#
#func _ready():
#	pass
#
#func _on_input(move, dodge):
#	if State == STATES.IDLE or State == STATES.MOVE:
#		movement = move * move_speed
#		if move :
#			pressed = true
#			State = STATES.MOVE
#			target_dir = move.normalized()
#		else:
#			pressed = false
#			State = STATES.IDLE
#	if dodge:
#		print("State is Dodge")
#		State = STATES.DODGE
#		movement = dodge * roll_speed
#
#func _process(_delta):
#	atk_cd-=1
#	if atk_cd <= 0:
#		atk_cd = atk_cd_default
#		State = STATES.ATTACK
#		var projectile = load("res://Projectile/Bullet.tscn")
#		var bullet = projectile.instance()
#		bullet.position = get_global_position()
#		bullet.move = target_dir
#		get_parent().add_child(bullet)
#
#	# STATE MACHINE
#	match State:
#		STATES.IDLE:
#			#print("Idle")
#			pass
#
#		STATES.MOVE:
#			#print("Moving")
#			pass
#
#		STATES.DODGE:
#			print("Rolling")
#			roll_dur -= 1
#			if roll_dur <= 0:
#				roll_dur = roll_dur_limit
#				State = STATES.IDLE
#
#		STATES.ATTACK:
#			print("Attack")
#			atk_dur -= 1
#			if atk_dur <= 0:
#				atk_dur = atk_dur_limit
#				State = STATES.IDLE
#
#
#	position += movement
#
#	anim_cd-=1
#	if anim_cd <= 0:
#		anim_cd = anim_cd_dur
#		anim_onChange()
#	update()
#
#func _draw():
#	pass#draw_line(Vector2(0,0), target_dir*300, Color(0,0,1,1), 5, 0)
#
#
#func anim_onChange():
#	anim_frame = (anim_frame+1)%anim_len
#	anim_dir = int(180 + rad2deg(target_dir.angle()))
#	var anim_point = ((anim_dir + 30) / 45) % 8
#	var frame_offset : int
#
#	match (State):
#		STATES.IDLE:
#			anim_len = 2
#			anim_cd = anim_cd_dur*2
#			anim.animation = "Idle"
#		STATES.MOVE:
#			anim_len = 2
#			anim_cd = anim_cd_dur
#			anim.animation = "Walk"
#		STATES.DODGE:
#			anim_point = 6
#			anim_len = 8
#			anim_cd = anim_cd_dur/2
#			anim.animation = "Dodge"
#		STATES.ATTACK:
#			anim_len = 5
#			anim_cd = anim_cd_dur
#			anim.animation = "Attack"
#
#	match (anim_point):
#		0:
#			#print("	Left: ", anim_point)
#			frame_offset = 6 * anim_len #12
#		1:
#			#print("	Up-Left: ", anim_point)
#			frame_offset = 5 * anim_len #10
#		2:
#			#print("	Up: ", anim_point)
#			frame_offset = 4 * anim_len #8
#		3:
#			#print("	Up-Right: ", anim_point)
#			frame_offset = 3 * anim_len #6
#		4:
#			#print("	Right: ", anim_point)
#			frame_offset = 2 * anim_len #4
#		5:
#			#print("	Down-Right: ", anim_point)
#			frame_offset = 1 * anim_len #2
#		6:
#			#print("	Down: ", anim_point)
#			frame_offset = 0
#		7:
#			#print("	Down-Left: ", anim_point)
#			frame_offset = 7 * anim_len #14
#	anim.frame = anim_frame + frame_offset
