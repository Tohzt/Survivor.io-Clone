extends Node2D
signal move_vector

var move = Vector2(0,0)
var dodge = Vector2(0,0)
var origin = Vector2(540,1800)
var touch = origin
var stick = origin
var rad = 200

var pressed = false
var drag = false
var drag_dist_prev = 0
var drag_dist = 0
var drag_cd = 0
var drag_dur = 5
var drag_limit = 100
var drag_origin = Vector2(0,0)
var drag_position = Vector2(0,0)

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			pressed = true
			touch = event.position
			stick = touch
			drag_origin = touch
			drag_position = drag_origin
			drag_dist = 0
		
		if !event.pressed:
			pressed = false
			drag = false
			touch = origin
			stick = origin
			move = Vector2(0,0)
			dodge = Vector2(0,0)
			if drag_dist >= drag_limit:
				dodge = drag_position - drag_origin
			emit_signal("move_vector", move.normalized(), dodge.normalized())
		
	if event is InputEventScreenDrag:
		if !drag:
			drag = true
			drag_cd = 0
		drag_position = event.position
		stick = touch - (touch - event.position).limit_length(rad)
		move = stick - touch
		emit_signal("move_vector", move.normalized(), dodge.normalized())
	
	update()

func _process(_delta):
	#emit_signal("move_vector", move.normalized(), dodge.normalized())
	if pressed:
		drag_dist_prev = drag_dist
		drag_dist = drag_origin.distance_to(drag_position)
		if drag_dist == drag_dist_prev or drag_cd == 0:
			drag_origin = drag_position
		drag_cd = (drag_cd + 1) % drag_dur

func _draw():
	var color = Color(1,1,1,0.5)
	#draw_circle(touch, rad, color)
	draw_arc(touch, rad, 0, deg2rad(360), 100, Color(1,1,1,0.25), 32, false)
	draw_circle(stick, rad/2, color)
