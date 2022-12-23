class_name BaseType
extends Node

enum TYPES_enum {
	Null,
	archer,
	mage,
	warrior,
}

var Player: Node2D

func enter(player: Node2D):
	Player = player
	print("hello type")
	pass

func exit():
	pass
