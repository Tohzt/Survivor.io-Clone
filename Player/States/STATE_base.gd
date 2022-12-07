class_name BaseState
extends Node

enum STATES_enum {
	Null,
	idle,
	walk,
	dodge,
	attack
}

var player: Node2D

func enter():
	pass

func check_state() -> int:
	return STATES_enum.Null

#!!
func move(_m,_d) -> Vector2:
	return Vector2.ZERO

func exit():
	pass
