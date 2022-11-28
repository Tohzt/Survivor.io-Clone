extends Node

var current_state: BaseState

onready var states = {
	BaseState.State.Idle: $Idle,
	BaseState.State.Walk: $Walk,
	BaseState.State.Dodge: $Dodge,
	BaseState.State.Attack: $Attack,
}

func init(player: Node2D) -> void:
	for child in get_children():
		child.player = player
	change_state(BaseState.State.Idle)

func input(move, dodge) -> void:
	var new_state = current_state.input(move, dodge)
	if new_state != BaseState.State.Null:
		change_state(new_state)

func change_state(new_state: int) -> void:
	if current_state:
		current_state.exit()
	
	current_state = states[new_state]
	current_state.enter()

func _process(delta):
	if current_state:
		var new_state = current_state.process(delta)
		if new_state != BaseState.State.Null:
			change_state(new_state)




