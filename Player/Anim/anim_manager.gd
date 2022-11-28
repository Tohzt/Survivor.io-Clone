extends Node


onready var anims = {
	BaseAnim.Anim.Idle_Anim: $Idle_Anim,
	BaseAnim.Anim.Walk_Anim: $Walk_Anim,
	BaseAnim.Anim.Dodge_Anim: $Dodge_Anim,
	BaseAnim.Anim.Attack_Anim: $Attack_Anim,
}

var prev_anim: BaseAnim
var current_anim: BaseAnim

func init(player: Node2D) -> void:
	for child in get_children():
		child.player = player
		child.anim = player.anim
	
	change_anim(BaseAnim.Anim.Idle_Anim)

func change_anim(new_anim: int) -> void:
	if current_anim:
		prev_anim = current_anim
		current_anim.exit()
	
	current_anim = anims[new_anim]
	current_anim.enter()

func _process(delta):
	#print("current: ", current_anim)
	if current_anim:
		current_anim.process(delta)
		#print("anim_man processing")
#		var new_anim = current_anim.process(delta)
#		if new_anim != BaseAnim.Anim.Null:
#			change_anim(new_anim)
