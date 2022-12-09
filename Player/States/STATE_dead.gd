extends BaseState


func enter(player) -> void:
	.enter(player)

func move(_move, _dodge) -> Vector2:
	return Vector2.ZERO

func check_state() -> int:
	return STATES_enum.Null

func exit() -> void:
	pass
