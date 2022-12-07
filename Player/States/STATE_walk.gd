extends BaseState

var speed = 300
var is_moving = false
var is_dodging = false

func enter() -> void:
	.enter()

func move(move, dodge) -> Vector2:
	is_moving = false
	if move:
		is_moving = true
		return move * speed
	is_dodging = false
	if dodge:
		is_dodging = true
		
	return Vector2.ZERO

func check_state() -> int:
	if is_dodging:
		return STATES_enum.dodge
	if !is_moving:
		return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	is_moving = false
	is_dodging = false
