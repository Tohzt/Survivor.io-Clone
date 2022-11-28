class_name BaseState
extends Node

enum State {
	Null,
	Idle,
	Walk,
	Dodge,
	Attack
}

var player: Node2D
var velocity : Vector2
export (int)   var speed = 0
export (float) var friction = 0.0

func enter() -> void:
	if player.animations.current_anim:
		player.animations.change_anim(State[player.states.current_state.name])
	pass

func exit() -> void:
	pass

func input(move, _dodge):
	if move:
		velocity = move * speed
		player.velocity = velocity
		player.speed = speed
		player.target_dir = move.normalized()
	return State.Null

func process(_delta: float) -> int:
	return State.Null
