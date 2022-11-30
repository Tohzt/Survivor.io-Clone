extends BaseAnim

func enter() -> void:
	anim_len = 2
	anim_cd_dur = 30
	if anim:
		anim.animation = "Idle"
	.enter()

func process(delta):
	anim_dir = int(180 + rad2deg(player.target_dir.angle()))
	anim_point = (anim_dir + 30) / 45
	
	match (anim_point % 8):
		0:
			#print("	Left: ", anim_point)
			frame_offset = 6 * anim_len #12
		1:
			#print("	Up-Left: ", anim_point)
			frame_offset = 5 * anim_len #10
		2:
			#print("	Up: ", anim_point)
			frame_offset = 4 * anim_len #8
		3:
			#print("	Up-Right: ", anim_point)
			frame_offset = 3 * anim_len #6
		4:
			#print("	Right: ", anim_point)
			frame_offset = 2 * anim_len #4
		5:
			#print("	Down-Right: ", anim_point)
			frame_offset = 1 * anim_len #2
		6:
			#print("	Down: ", anim_point)
			frame_offset = 0
		7:
			#print("	Down-Left: ", anim_point)
			frame_offset = 7 * anim_len #14
	
	anim.frame = anim_frame + frame_offset
	.process(delta)

func exit() -> void:
	.exit()
