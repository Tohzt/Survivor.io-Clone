extends BaseAnim

func enter() -> void:
	anim_len = 2
	anim_cd_dur = 30
	if player_anim:
		player_anim.animation = "Idle"
	.enter()

func process():
	.update_spriteDirection()
	.process()

func exit() -> void:
	.exit()
