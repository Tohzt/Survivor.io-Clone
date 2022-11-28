extends BaseAnim

func enter() -> void:
	print("Enter Idle_Anim")
	anim_len = 2
	anim_cd_dur = 30
	anim_cd = anim_cd_dur
	if anim:
		anim.animation = "Idle"
	.enter()

func exit() -> void:
	.exit()
