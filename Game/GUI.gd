extends Label

var Game:Node2D
var margin = 50
var width = OS.get_screen_size().x - margin*2
var height = 60
var bgr_col = Color(0.2,0.2,.2,1)
var prev_level = 1
var level = 1
var xp_disp = 0
var xp = 0
var xp_needed = 1
var xp_last_level = 0
var kill_count = 0
var dynamic_font: DynamicFont

func _ready():
	Game = get_parent().get_parent()
	if OS.get_name() == "Windows":
		width = OS.get_screen_size().y - margin*2
	
	dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Game/Assets/Font.TTF")
	dynamic_font.size = 40
	self.set("custom_fonts/font", dynamic_font)

func _process(_delta):
	# Update Game Values
	kill_count = Game.kill_count
	xp = Game.xp
	xp_needed = Game.xp_needed
	xp_last_level = Game.xp_last_level
	level = Game.level
	xp_disp = lerp(0, width-16, float(xp-xp_last_level)/float(xp_needed))
	update()
	if level != prev_level:
		prev_level = level
		get_parent().get_parent()._on_Pause_pressed()
	
func _draw():
	# KILL COUNT
	draw_circle(Vector2(width + 20, margin*1.5),40,bgr_col)
	draw_circle(Vector2(width - 100, margin*1.5),40,bgr_col)
	var kill_bgr = Rect2(width-100, 34, 110, 80)
	draw_rect(kill_bgr,bgr_col,true)
	draw_string(dynamic_font, Vector2(width-110, margin*1.5+20), "Kills: " + str(kill_count), Color(1,1,1,1))
	
	# XP BAR
	var xp_bgr = Rect2(margin, margin*2.5, width, height)
	draw_rect(xp_bgr,bgr_col,true)
	var xp_bar = Rect2(margin+8, margin*2.5+8, xp_disp, height-16)
	draw_rect(xp_bar,Color(0,1,0,1),true)
	var lvl_bgr = Rect2(margin, 180, 230, height)
	draw_rect(lvl_bgr,bgr_col,true)
	draw_string(dynamic_font, Vector2(80, 230), "Level: " + str(level), Color(1,1,1,1))
	
