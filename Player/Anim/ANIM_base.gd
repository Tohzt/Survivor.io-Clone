class_name BaseAnim
extends Node

var player: Node2D
var anim: Node2D
var anim_dir = 0
var anim_len = 2
var anim_frame = 0
var anim_cd_dur = 0
var anim_cd = anim_cd_dur
var anim_point : int
var frame_offset : int

enum Anim {
	Null,
	ANIM_idle,
	ANIM_walk,
	ANIM_dodge,
	ANIM_attack
}

func enter() -> void:
	# @TODO: Set animation to current state
	anim_frame = 0
	anim_cd = anim_cd_dur
	anim_updateFrame()

func process(_delta: float) -> void:
	anim_cd-=1
	if anim_cd <= 0:
		anim_cd = anim_cd_dur
		anim_updateFrame()

func anim_updateFrame() -> void:
	anim_frame = (anim_frame+1) % anim_len
	anim.frame = anim_frame + frame_offset

func exit() -> void:
	pass
