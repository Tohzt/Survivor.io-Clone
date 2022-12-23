class_name Player
extends Node2D

onready var player_type = $PLAYER_type
onready var state_manager = $STATE_manager
onready var anim_manager = $ANIM_manager
onready var animated_sprite : AnimatedSprite

var target_dir = Vector2(0,-1)
var knockback = Vector2.ZERO
var hp_max = 100
var hp = hp_max

func _ready() -> void:
	# Init State/Anim Machines
	match Singleton.type:
		"Archer":
			animated_sprite = $ArcherAnim
		"Mage":
			animated_sprite = $MageAnim
		"Soldier":
			animated_sprite = $SoldierAnim
	
	animated_sprite.visible = true
	
	player_type.init(Singleton.type)
	state_manager.init(self)
	anim_manager.init(self)

func _process(delta):
	# Update Target Direction
	if state_manager.move_vector:
		target_dir = state_manager.move_vector.normalized()
	
	# Trigger State Machine
	state_manager.process()
	position += state_manager.move_vector * delta
	if knockback:
		position += knockback
		knockback = knockback.move_toward(Vector2.ZERO, 1)
	
	if hp < 0:
		hp = 0

func _on_Area2D_area_entered(other):
	# Collect XP
	#print(other.name)
	if other.name == "Loot_Area2D":
		get_tree().root.get_child(0).xp += other.get_parent().value
		#level_up()
		other.get_parent().pickup()
	
	elif other.name == "Enemy_Area2D" and state_manager.current_state.name != "STATE_dodge":
		knockback = (position - other.get_parent().position).normalized() * other.get_parent().knockback
		hp -= other.get_parent().damage
