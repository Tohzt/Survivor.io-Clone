extends BaseState

var dodge_dur_default = 0.25
var dodge_dur = dodge_dur_default
var start : Vector2

func enter() -> void:
	start = player.position
	player.speed = 100
	.enter()

func process(delta) -> int:
	dodge_dur-=delta
	if dodge_dur <= 0:
		dodge_dur = dodge_dur_default
		return State.Idle
	return State.Null

func exit() -> void:
	.exit()
