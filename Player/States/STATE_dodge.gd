extends BaseState

var speed = 3000
var _dur: int
var start : Vector2

func enter() -> void:
	_dur = 20
	.enter()

func move(_move, dodge) -> Vector2:
	return dodge * speed

func check_state() -> int:
	_dur-=1
	if _dur <= 0:
		return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	pass
