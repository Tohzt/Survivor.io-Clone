extends Node

var current_state: BaseState
var player: Node2D
var move_vector: Vector2
var input_move: Vector2
var input_dodge: Vector2
var atk_cd_default : float = 50
var atk_cd : float = atk_cd_default

onready var STATES = {
	BaseState.STATES_enum.idle: $STATE_idle,
	BaseState.STATES_enum.walk: $STATE_walk,
	BaseState.STATES_enum.dodge: $STATE_dodge,
	BaseState.STATES_enum.attack: $STATE_attack,
}

func init(_player: Node2D) -> void:
	player = get_parent()
	current_state = STATES[BaseState.STATES_enum.idle]

func change_state(new_state: int) -> void:
	if current_state:
		current_state.exit()
		
	# Update Anim to match current_state
	player.anim_manager.change_anim(new_state)
	
	current_state = STATES[new_state]
	current_state.enter()

func _on_Joystick(move, dodge):
	input_move = move
	input_dodge = dodge
	
func process():
	if current_state:
		# Update Movement Vector
		move_vector = current_state.move(input_move, input_dodge)
		
		# Update Current State
		var new_state = current_state.check_state()
		if new_state != BaseState.STATES_enum.Null:
			change_state(new_state)
		
		# Trigger Attack
		atk_cd-=1
		if atk_cd <= 0:
			atk_cd = atk_cd_default
			change_state(4)










