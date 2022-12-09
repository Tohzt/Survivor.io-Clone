extends Node

var current_anim: BaseAnim

onready var ANIMS = {
	BaseAnim.ANIM_enum.IDLE: $ANIM_idle,
	BaseAnim.ANIM_enum.WALK: $ANIM_walk,
	BaseAnim.ANIM_enum.DODGE: $ANIM_dodge,
	BaseAnim.ANIM_enum.ATTACK: $ANIM_attack,
	BaseAnim.ANIM_enum.DEAD: $ANIM_dead,
}

func init(player: Node2D) -> void:
	for child in get_children():
		child.player = player
		child.player_anim = player.animated_sprite
	
	change_anim(BaseAnim.ANIM_enum.IDLE)

func change_anim(new_anim: int) -> void:
	if current_anim:
		current_anim.exit()
	
	current_anim = ANIMS[new_anim]
	current_anim.enter()

func _process(_delta):
	if current_anim:
		current_anim.process()
