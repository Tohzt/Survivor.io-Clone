extends BaseState

var speed = 300
var _anim_frame : int
var _anim_len : int
var is_moving: bool
var _dur: int

func enter(player) -> void:
	Player = player
	_dur = 20
	.enter(player)
	spawn_projectile()

func move(move, _dodge) -> Vector2:
	is_moving = false
	if move:
		is_moving = true
#		return move * speed
	return Vector2.ZERO

func check_state() -> int:
	_dur-=1
	if _dur <= 0:
		pass#return STATES_enum.idle
	#return STATES_enum.Null
	
	
	_anim_frame = Player.anim_manager.current_anim.anim_frame
	_anim_len = Player.anim_manager.current_anim.anim_len
	if _anim_frame == _anim_len-1:
		if is_moving:
			return STATES_enum.walk
		else:
			return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	pass


func spawn_projectile() -> void:
	var projectile = load("res://Projectile/Bullet.tscn")
	var bullet = projectile.instance()
	bullet.position = get_parent().get_parent().get_global_position()
	bullet.move = get_parent().get_parent().target_dir
	get_parent().add_child(bullet)
