extends BaseAnim

func enter() -> void:
	player.anim_len = 5
	player.anim_cd = player.anim_cd_dur
	player.anim.animation = "Attack"
	.enter()

func exit() -> void:
	.exit()
