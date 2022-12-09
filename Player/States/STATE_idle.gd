extends BaseState

var friction = 2.5
var is_moving = false

func move(move, _dodge) -> Vector2:
	if move:
		is_moving = true
	else:
		is_moving = false
	return Vector2.ZERO

func check_state() -> int:
	if is_moving:
		return STATES_enum.walk
	return STATES_enum.Null
