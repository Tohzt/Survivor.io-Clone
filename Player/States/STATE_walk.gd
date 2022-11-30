extends BaseState

var speed = 300
var _moving = false
var _dodging = false

func enter() -> void:
	.enter()

func move(move, dodge) -> Vector2:
	_moving = false
	if move:
		_moving = true
		return move * speed
	_dodging = false
	if dodge:
		_dodging = true
		
	return Vector2.ZERO

func check_state() -> int:
	if _dodging:
		return STATES_enum.dodge
	if !_moving:
		return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	_moving = false
	_dodging = false
