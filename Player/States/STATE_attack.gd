extends BaseState

var speed = 300
var _anim_frame : int
var _anim_len : int
var _moving: bool
var _dur: int

func enter() -> void:
	_dur = 20
	.enter()
	spawn_projectile()

func move(move, _dodge) -> Vector2:
	_moving = false
	if move:
		_moving = true
		return move * speed
	return Vector2.ZERO

func check_state() -> int:
	_dur-=1
	if _dur <= 0:
		return STATES_enum.idle
	return STATES_enum.Null
#	_anim_frame = player.anim_manager.current_anim.anim_frame
#	_anim_len = player.anim_manager.current_anim.anim_len
#	if _anim_frame == _anim_len-1:
#		if _moving:
#			return STATES_enum.walk
#		else:
#			return STATES_enum.idle
#	return STATES_enum.Null

func exit() -> void:
	pass


func spawn_projectile() -> void:
	var projectile = load("res://Projectile/Bullet.tscn")
	var bullet = projectile.instance()
	bullet.position = get_parent().get_parent().get_global_position()
	bullet.move = get_parent().get_parent().target_dir
	get_parent().add_child(bullet)
