extends BaseState

var friction = 2.5
var _moving = false

func enter():
	.enter()

func move(move, _dodge) -> Vector2:
	if move:
		_moving = true
	else:
		_moving = false
	return Vector2.ZERO

func check_state() -> int:
	if _moving:
		return STATES_enum.walk
	return STATES_enum.Null

func exit() -> void:
	pass
