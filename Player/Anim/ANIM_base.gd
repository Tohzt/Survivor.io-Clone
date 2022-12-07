class_name BaseAnim
extends Node

var player: Node2D
var player_anim: Node2D
var anim_dir = 0
var anim_len = 2
var anim_frame = 0
var anim_cd_dur = 0
var anim_cd = anim_cd_dur
var anim_point : int
var frame_offset : int

enum ANIM_enum {
	Null,
	IDLE,
	WALK,
	DODGE,
	ATTACK
}

func enter() -> void:
	anim_frame = 0
	anim_cd = anim_cd_dur
	anim_updateFrame()

func process():
	anim_cd-=1
	if anim_cd <= 0:
		anim_cd = anim_cd_dur
		anim_updateFrame()

func update_spriteDirection() -> void:
	anim_dir = int(180 + rad2deg(player.target_dir.angle()))
	anim_point = (anim_dir + 30) / 45
	
	match (anim_point % 8):
		0: # Left
			frame_offset = 6 * anim_len #12
		1: # Up-Left
			frame_offset = 5 * anim_len #10
		2: # Up
			frame_offset = 4 * anim_len #8
		3: # Up-Right
			frame_offset = 3 * anim_len #6
		4: # Right
			frame_offset = 2 * anim_len #4
		5: # Down-Right
			frame_offset = 1 * anim_len #2
		6: # Down
			frame_offset = 0
		7: # Down-Left
			frame_offset = 7 * anim_len #14
	
	player_anim.frame = anim_frame + frame_offset

func anim_updateFrame() -> void:
	anim_frame = (anim_frame+1) % anim_len
	player_anim.frame = anim_frame + frame_offset

func exit() -> void:
	pass
