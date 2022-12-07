extends BaseAnim

func enter() -> void:
	anim_len = 2
	anim_cd_dur = 10
	anim_cd = anim_cd_dur
	player_anim.animation = "Walk"
	.enter()

func process():
	.update_spriteDirection()
	.process()

func exit() -> void:
	.exit()
