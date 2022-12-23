extends Node

var current_type: BaseType
var player: Node2D

onready var TYPES = {
	BaseType.TYPES_enum.archer: $STATE_idle,
	BaseType.TYPES_enum.mage: $STATE_walk,
	BaseType.TYPES_enum.warrior: $STATE_dodge,
}

func init(string) -> void:
	print(string)
	current_type = TYPES[BaseType.TYPES_enum.archer]
