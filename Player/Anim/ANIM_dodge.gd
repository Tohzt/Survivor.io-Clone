extends BaseAnim

var start : Vector2

func enter() -> void:
	anim_len = 8
	anim_cd_dur = 1
	anim_cd = anim_cd_dur
	if player_anim:
		player_anim.animation = "Dodge"
	.enter()

func exit() -> void:
	.exit()
