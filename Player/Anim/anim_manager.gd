extends Node

var prev_anim: BaseAnim
var current_anim: BaseAnim

onready var anims = {
	BaseAnim.Anim.ANIM_idle: $ANIM_idle,
	BaseAnim.Anim.ANIM_walk: $ANIM_walk,
	BaseAnim.Anim.ANIM_dodge: $ANIM_dodge,
	BaseAnim.Anim.ANIM_attack: $ANIM_attack,
}

func init(player: Node2D) -> void:
	for child in get_children():
		child.player = player
		child.anim = player.animated_sprite
	
	change_anim(BaseAnim.Anim.ANIM_idle)

func change_anim(new_anim: int) -> void:
	if current_anim:
		prev_anim = current_anim
		current_anim.exit()
	
	current_anim = anims[new_anim]
	current_anim.enter()

func _process(delta):
	if current_anim:
		current_anim.process(delta)
