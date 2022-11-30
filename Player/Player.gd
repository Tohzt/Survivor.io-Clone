class_name Player
extends Node2D

onready var state_manager = $STATE_manager
onready var anim_manager = $ANIM_manager
onready var animated_sprite = $AnimatedSprite

var target_dir = Vector2(0,-1)
var level = 1
var xp = 0
var xp_needed = 10

func _ready() -> void:
	# Init State/Anim Machines
	state_manager.init(self)
	anim_manager.init(self)

func _process(delta):
	# Update Target Direction
	if state_manager.move_vector:
		target_dir = state_manager.move_vector.normalized()
	
	# Trigger State Machine
	state_manager.process()
	position += state_manager.move_vector * delta

func _on_Area2D_area_entered(other):
	# Collect XP
	if other.name == "Loot_Area2D":
		xp += other.get_parent().value
		level_up()
		other.get_parent().pickup()

func level_up() -> void:
	if xp >= xp_needed:
		level+=1
		xp_needed += 10
