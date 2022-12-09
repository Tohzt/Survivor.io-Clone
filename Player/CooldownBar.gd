extends Node2D

onready var player = get_parent()
onready var Game = get_tree().root.get_child(0)
var cd : float
var cd_dur : float
var hp : float
var hp_max : float
var _width : float = 100
var _height_hp : int = 25
var _height_cd : int = 15
var _margin = 4
var amnt_full = _width-(_margin*2)
var amnt = amnt_full
var hp_amnt = amnt_full

func _ready():
	pass

func _process(_delta):
	cd = player.state_manager.atk_cd
	cd_dur = player.state_manager.atk_cd_default
	amnt = lerp(0, amnt_full, (cd/cd_dur))
	
	hp = player.hp 
	hp_max = player.hp_max
	hp_amnt = lerp(0,amnt_full, (hp/hp_max))
	update()
	
	if player.hp <= 0:
		Game._on_Pause_pressed()

func _draw():
	# Health Bar
	var _yPos = 40
	var rect_outer = Rect2(int(-(_width/2)), _yPos, _width, _height_hp)
	var rect_depth = Rect2(int(-(_width/2))+_margin, _yPos+_margin, _width-(_margin*2), _height_hp-(_margin*2))
	var rect_inner = Rect2(int(-(_width/2))+_margin, _yPos+_margin, hp_amnt, _height_hp-(_margin*2))
	draw_rect(rect_outer,Color(0.2,0.2,.2,0.8),true)
	draw_rect(rect_depth,Color(0.1,0.1,.1,0.8),true)
	draw_rect(rect_inner,Color(0,1,0,0.8),true)
	
	# Attack Bar
	_yPos = 60
	rect_outer = Rect2(int(-(_width/2)), _yPos, _width, _height_cd)
	rect_depth = Rect2(int(-(_width/2))+_margin, _yPos+_margin, _width-(_margin*2), _height_cd-(_margin*2))
	rect_inner = Rect2(int(-(_width/2))+_margin, _yPos+_margin, amnt, _height_cd-(_margin*2))
	draw_rect(rect_outer,Color(0.2,0.2,.2,0.8),true)
	draw_rect(rect_depth,Color(0.1,0.1,.1,0.8),true)
	draw_rect(rect_inner,Color(1,1,0,0.8),true)
