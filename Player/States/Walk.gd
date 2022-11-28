extends BaseState

func enter() -> void:
	speed = 20
	.enter()
	
func exit() -> void:
	.exit()

func input(move, dodge) -> int:
	.input(move, dodge)
	if dodge:
		return State.Dodge
	if !move:
		return State.Idle
	return State.Null

