extends BaseState

var speed = 2000
var _dur: int
var start : Vector2

func enter(player) -> void:
	_dur = 20
	.enter(player)

func move(_move, dodge) -> Vector2:
	return dodge * speed

func check_state() -> int:
	_dur-=1
	if _dur <= 0:
		return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	pass
