extends BaseAnim

func enter() -> void:
	anim_len = 4
	anim_cd_dur = 5
	anim_cd = anim_cd_dur
	if player_anim:
		player_anim.animation = "Attack"
	.enter()

func process():
	.update_spriteDirection()
	.process()

func exit() -> void:
	.exit()
