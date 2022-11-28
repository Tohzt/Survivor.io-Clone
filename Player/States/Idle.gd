extends BaseState


func enter() -> void:
	friction = 3.0
	.enter()

func input(move, _dodge) -> int:
	if player.velocity:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, friction)
	
	if move:
		return State.Walk
	return State.Null

func exit() -> void:
	.exit()
